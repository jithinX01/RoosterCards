import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rooster_cards/cards/player_card_stack.dart';
import 'package:rooster_cards/proto/user_data.pb.dart';
import 'package:rooster_cards/utilities/elimination_card.dart';
import 'package:rooster_cards/utilities/file_storage.dart';
import 'package:rooster_cards/utilities/game_win_card.dart';
import 'package:rooster_cards/proto/game_msg.pb.dart';
import 'package:rooster_cards/rummy/rummy_user_action.dart';
import 'package:rooster_cards/utilities/global_user_data_info.dart';
import 'package:rooster_cards/utilities/timer_button.dart';
import 'package:rooster_cards/utilities/timer_message.dart';
import 'package:rooster_cards/utilities/tournament_winners_card.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
//import 'package:rooster_cards/rummy/waiting_screen.dart';

class RummyPlay extends StatefulWidget {
  final WebSocketChannel channel;
  final StreamSubscription streamSubscription;
  final StartTournament startTournament;
  final bool withComputer;

  RummyPlay(
      {Key? key,
      required this.channel,
      required this.streamSubscription,
      required this.startTournament,
      this.withComputer = false})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _RummyPlayState createState() => _RummyPlayState();
}

class _RummyPlayState extends State<RummyPlay> {
  List<Widget> _wl = List.empty(growable: true);
  StartTournament _tournamentData = StartTournament();
  StackMode _mode = StackMode.SWAP_MODE;
  Timer? _t;
  bool _tournamentOver = false;
  //late List<int> _playerCards;
  @override
  void initState() {
    super.initState();
    widget.streamSubscription.onData(_onData);
    _tournamentData = widget.startTournament;
    //_playerCards = List.from(_tournamentData.cards, growable: true);
    _wl.add(_getPlayingCards());
    _wl.add(_getTimer());
  }

  @override
  void dispose() {
    //AutoOrientation.portraitAutoMode();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    if (_t != null && _t!.isActive) _t?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //return WaitingScreen();
    //AutoOrientation.landscapeAutoMode();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);

    return WillPopScope(
      child: Scaffold(
        body: Container(
          child: _getScreen(),
          //padding: const EdgeInsets.only(top: 32),
        ),
      ),
      onWillPop: _willPop,
    );
  }

  Future<bool> _willPop() async {
    bool willLeave = _tournamentOver;
    if (!_tournamentOver) {
      // show the confirm dialog
      await showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text('Exit Game?'),
                actions: [
                  TextButton(
                      onPressed: () {
                        willLeave = true;
                        Navigator.of(context).pop();
                      },
                      child: Text('Yes')),
                  ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('No'))
                ],
              ));
    }
    return willLeave;
  }

  void _onData(data) {
    //rprint("onData Rummy Play");
    GameMessageServer gms = GameMessageServer.fromBuffer(data);
    _handleServerMessage(gms);
  }

  void _handleServerMessage(GameMessageServer gms) {
    switch (gms.whichPayLoad()) {
      case GameMessageServer_PayLoad.gameServerUpdate:
        _handleGameServerUpdate(gms.gameServerUpdate);
        break;
      case GameMessageServer_PayLoad.tournamentOver:
        _handleTournamentOver(gms.tournamentOver);
        break;
      default:
    }
  }

  void _handleGameServerUpdate(GameServerUpdate gmUpdate) {
    if (gmUpdate.hasRummyPlayerStat()) {
      switch (gmUpdate.rummyPlayerStat.whichStat()) {
        case RummyPlayerStat_Stat.activeRPS:
          _handleActiveRPS(gmUpdate.rummyPlayerStat.activeRPS);
          break;
        case RummyPlayerStat_Stat.inactiveRPS:
          _handleInActiveRPS(gmUpdate.rummyPlayerStat.inactiveRPS);
          break;
        case RummyPlayerStat_Stat.nextGame:
          _handleNextGame(gmUpdate.rummyPlayerStat.nextGame);
          break;
        case RummyPlayerStat_Stat.wonPlayerStat:
          _handleWonPlayerStat(gmUpdate.rummyPlayerStat.wonPlayerStat);
          break;
        case RummyPlayerStat_Stat.losePlayerStat:
          _handleLosePlayerStat(gmUpdate.rummyPlayerStat.losePlayerStat);
          break;
        case RummyPlayerStat_Stat.eliminated:
          _handleEliminated(gmUpdate.rummyPlayerStat.eliminated);
          break;
        default:
      }
    } else {
      //rprint("Something wrong with Rummy gms update");
    }
  }

  void _handleActiveRPS(ActiveRummyPlayerStat activeRummyPlayerStat) {
    //rprint("next card");
    //rprint(activeRummyPlayerStat.nextCard);
    _tournamentData.youStart = true;
    _tournamentData.nextCard = activeRummyPlayerStat.nextCard;
    _tournamentData.arpAction = activeRummyPlayerStat.arpAction;
    _mode = StackMode.REPLACE_MODE;
    _wl.clear();
    _wl.add(_getPlayingCards());
    _wl.add(_getStatusButton(true));
    _wl.add(_getTimerMessage(activeRummyPlayerStat.status));
    setState(() {});
  }

  void _handleInActiveRPS(InActiveRummyPlaterStat inActiveRummyPlaterStat) {
    //rprint("handleInActive");
    //rprint(inActiveRummyPlaterStat.status);
    _tournamentData.youStart = false;
    int activePlayerId = inActiveRummyPlaterStat.activePlayerId;
    String activePlayer = _tournamentData.playerMap[activePlayerId] ?? "";

    setState(() {
      _wl.clear();
      _wl.add(_getPlayingCards());
      _wl.add(_getStatusButton(false, player: activePlayer));
      _wl.add(_getTimerMessage(inActiveRummyPlaterStat.status));
    });
  }

  void _handleWonPlayerStat(WonPlayerStat wonPlayerStat) {
    _wl.clear();
    _wl.add(GameWinCard(
      round: !widget.withComputer
          ? "Round " + wonPlayerStat.round.toString()
          : "Robo Match",
      afterWinCards: wonPlayerStat.afterWinCards,
      points: wonPlayerStat.points,
      stat: PlayerStat.WINNER,
      computerGame: widget.withComputer,
    ));
    setState(() {});
  }

  void _handleLosePlayerStat(LosePlayerStat losePlayerStat) {
    _wl.clear();
    _mode = StackMode.VIEW_MODE;
    _tournamentData.cards.clear();
    _tournamentData.cards.addAll(losePlayerStat.winningCards);
    _wl.add(_getPlayingCards());
    _wl.add(GameWinCard(
        computerGame: widget.withComputer,
        afterWinCards: losePlayerStat.afterWinCards,
        points: losePlayerStat.points,
        stat: PlayerStat.LOSER,
        player: losePlayerStat.wonPlayer,
        round: !widget.withComputer
            ? "Round " + losePlayerStat.round.toString()
            : "Robo Match"));
    setState(() {});
  }

  void _handleNextGame(NextGame nextGame) {
    _tournamentData.activePlayerId = nextGame.activePlayerId;
    _tournamentData.cards.clear();
    _tournamentData.cards.addAll(nextGame.cards);
    _tournamentData.youStart = nextGame.youStart;
    _tournamentData.nextCard = nextGame.nextCard;
    _tournamentData.round = nextGame.round;

    _t = Timer(Duration(seconds: 25), () {
      _wl.clear();
      _wl.add(_getPlayingCards());
      _wl.add(_getTimer());
      setState(() {});
    });
  }

  void _handleTournamentOver(TournamentOver tournamentOver) {
    _tournamentOver = true;

    //save the info for trophy
    if (tournamentOver.youWon) {
      saveTrophy(
          UserDataInfo.of(context).userInfo.trophyDir,
          TrophyData(
            tournamentName: _tournamentData.tournamentName,
            trophyId: _tournamentData.trophyId,
            trophyWinners: tournamentOver.trophyWinners,
            shared: tournamentOver.sharedTrophy,
          ));
    }
    UserDataInfo.of(context).userInfo.coins += tournamentOver.coinTransaction;
    saveUserData(UserDataInfo.of(context).userInfo);
    if (widget.withComputer) {
      /*
      _t = Timer(Duration(seconds: 25), () {
        Navigator.pop(context);
      });
      */
      return;
    }
    _t = Timer(Duration(seconds: 25), () {
      setState(() {
        _wl.clear();
        _wl.add(TournamentWinnersCard(
          wonPlayers: tournamentOver.trophyWinners,
          sharedTrophy: tournamentOver.sharedTrophy,
          tournamentName: _tournamentData.tournamentName,
          c: Colors.orangeAccent,
        ));
      });
      /*
      _t = Timer(Duration(seconds: 7), () {
        Navigator.pop(context);
      });
      */
    });
  }

  void _handleEliminated(Eliminated eliminated) {
    UserDataInfo.of(context).userInfo.coins += eliminated.coinTransaction;
    saveUserData(UserDataInfo.of(context).userInfo);
    _t = Timer(Duration(seconds: 25), () {
      setState(() {
        _wl.clear();
        _wl.add(EliminationCard(
          points: eliminated.totalPoints,
          round: "Round " + eliminated.round.toString(),
        ));
      });
    });
  }

  Widget _getScreen() {
    return Stack(
      children: _wl,
    );
  }

  Widget _getPlayingCards() {
    return Container(
        child: PlayerCardStack(
      cards: _tournamentData.cards,
      vertical: false,
      mode: _mode,
      nextCard: _tournamentData.nextCard,
      onUserAction: (val) {
        //rprint(val.rUserAction);
        _handleUserAction(val);
        //setState(() {});
      },
    ));
  }

  void _handleUserAction(RummyUserAction rummyUserAction) {
    switch (rummyUserAction.rUserAction) {
      case RUserAction.DISCARD:
        //rprint(rummyUserAction.newCard);
        //rprint("Discarded");
        _mode = StackMode.SWAP_MODE;
        /*
        _tournamentData.cards.clear();
        _tournamentData.cards.addAll(rummyUserAction.cards);
        */
        _wl.clear();
        _wl.add(_getPlayingCards());
        _wl.add(_getStatusButton(false));
        setState(() {});
        GameMessageClient gmc = GameMessageClient(
          clientGameStat: ClientGameStat(
            playerId: _tournamentData.yourId,
            tournamentId: _tournamentData.tournamentId,
            discardCard: DiscardCard(
              card: rummyUserAction.newCard,
            ),
          ),
        );

        widget.channel.sink.add(gmc.writeToBuffer());
        break;
      case RUserAction.NORMAL_SWAP:
        _tournamentData.cards.clear();
        _tournamentData.cards.addAll(rummyUserAction.cards);
        //rprint("Normal Swap");
        break;
      case RUserAction.MAXIMISE:
        _mode = StackMode.REPLACE_MODE;
        _wl.clear();
        _wl.add(_getPlayingCards());
        _wl.add(_getStatusButton(true));
        setState(() {});
        break;
      case RUserAction.MINIMISE:
        _mode = StackMode.MINIMISE_MODE;
        _wl.clear();
        _wl.add(_getPlayingCards());
        _wl.add(_getStatusButton(true));
        setState(() {});
        break;
      case RUserAction.REPLACE:
        _mode = StackMode.SWAP_MODE;
        _tournamentData.cards.clear();
        _tournamentData.cards.addAll(rummyUserAction.cards);
        //rprint(rummyUserAction.cards);
        _wl.clear();
        _wl.add(_getPlayingCards());
        _wl.add(_getStatusButton(false));
        setState(() {});
        //send data to server
        GameMessageClient gmc = GameMessageClient(
          clientGameStat: ClientGameStat(
            playerId: _tournamentData.yourId,
            tournamentId: _tournamentData.tournamentId,
            drawCard: DrawCard(
              newCard: rummyUserAction.newCard,
              oldCard: rummyUserAction.oldCard,
            ),
          ),
        );
        widget.channel.sink.add(gmc.writeToBuffer());
        //rprint("replace");

        break;
      default:
    }
  }

  Widget _getStatusButton(bool active, {String player = "You"}) {
    return Positioned(
      top: 20,
      left: 20,
      child: FloatingActionButton.extended(
        icon: Icon(Icons.router_rounded),
        label: Text(
          active ? player : player,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: active ? Colors.green : Colors.red,
        foregroundColor: Colors.black,
        heroTag: "ggbb_status",
        onPressed: () {
          //rprint("pressed");
        },
      ),
    );
  }

  Widget _getTimer() {
    return Positioned.fill(
      top: 20,
      child: Align(
        alignment: Alignment.topCenter,
        child: TimerButton(
            onEnd: () {
              _wl.clear();
              if (_tournamentData.youStart) {
                _mode = StackMode.REPLACE_MODE;
                _wl.add(_getPlayingCards());
                _wl.add(_getStatusButton(true));
                //_wl.add(_getPopCard(widget.startTournament.nextCard));
              } else {
                String activePlayer =
                    _tournamentData.playerMap[_tournamentData.activePlayerId] ??
                        "";
                _mode = StackMode.SWAP_MODE;
                _wl.add(_getPlayingCards());
                _wl.add(_getStatusButton(false, player: activePlayer));
              }
              setState(() {});
            },
            time: 10),
      ),
    );
  }

  Widget _getTimerMessage(String message) {
    return Positioned.fill(
      top: 20,
      child: Align(
        alignment: Alignment.topCenter,
        child: TimerMessage(time: 3, message: message),
      ),
    );
  }
}
