import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rooster_cards/cards/boxofcards.dart';
import 'package:rooster_cards/cards/playing_card.dart';
import 'package:rooster_cards/proto/game_msg.pb.dart';
import 'package:rooster_cards/rummy/rummy_user_action.dart';
import 'package:rooster_cards/timer_button.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:auto_orientation/auto_orientation.dart';

//import 'package:rooster_cards/rummy/waiting_screen.dart';

class RummyPlay extends StatefulWidget {
  final WebSocketChannel channel;
  final StreamSubscription streamSubscription;
  final StartTournament startTournament;

  RummyPlay(
      {Key? key,
      required this.channel,
      required this.streamSubscription,
      required this.startTournament})
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
  Widget build(BuildContext context) {
    //return WaitingScreen();
    AutoOrientation.landscapeAutoMode();
    return Scaffold(
      body: Container(
        child: _getScreen(),
        //padding: const EdgeInsets.only(top: 32),
      ),
    );
  }

  void _onData(data) {
    print("onData Rummy Play");
    GameMessageServer gms = GameMessageServer.fromBuffer(data);
    _handleServerMessage(gms);
  }

  void _handleServerMessage(GameMessageServer gms) {
    switch (gms.whichPayLoad()) {
      case GameMessageServer_PayLoad.gameServerUpdate:
        _handleGameServerUpdate(gms.gameServerUpdate);
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
        default:
      }
    } else {
      print("Something wrong with Rummy gms update");
    }
  }

  void _handleActiveRPS(ActiveRummyPlayerStat activeRummyPlayerStat) {
    print("next card");
    print(activeRummyPlayerStat.nextCard);
    _tournamentData.nextCard = activeRummyPlayerStat.nextCard;
    _mode = StackMode.REPLACE_MODE;
    _wl.clear();
    _wl.add(_getPlayingCards());
    _wl.add(_getStatusButton(true));
    setState(() {});
  }

  void _handleInActiveRPS(InActiveRummyPlaterStat inActiveRummyPlaterStat) {
    int activePlayerId = inActiveRummyPlaterStat.activePlayerId;
    String activePlayer =
        widget.startTournament.playerMap[activePlayerId] ?? "";
    _wl.removeLast();
    _wl.add(_getStatusButton(false, player: activePlayer));
    setState(() {});
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
        print(val.rUserAction);
        _handleUserAction(val);
        setState(() {});
      },
    ));
  }

  void _handleUserAction(RummyUserAction rummyUserAction) {
    switch (rummyUserAction.rUserAction) {
      case RUserAction.DISCARD:
        print(rummyUserAction.newCard);
        print("Discarded");
        _mode = StackMode.SWAP_MODE;
        _tournamentData.cards.clear();
        _tournamentData.cards.addAll(rummyUserAction.cards);
        _wl.clear();
        _wl.add(_getPlayingCards());
        _wl.add(_getStatusButton(false));
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
        print("Normal Swap");
        break;
      case RUserAction.REPLACE:
        _mode = StackMode.SWAP_MODE;
        _tournamentData.cards.clear();
        _tournamentData.cards.addAll(rummyUserAction.cards);
        _wl.clear();
        _wl.add(_getPlayingCards());
        _wl.add(_getStatusButton(false));
        print("replace");

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
          print("pressed");
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
              _wl.removeLast();
              if (widget.startTournament.youStart) {
                _mode = StackMode.REPLACE_MODE;
                _wl.clear();
                _wl.add(_getPlayingCards());
                _wl.add(_getStatusButton(true));
                //_wl.add(_getPopCard(widget.startTournament.nextCard));
              } else {
                String activePlayer = widget.startTournament
                        .playerMap[widget.startTournament.activePlayerId] ??
                    "";
                _wl.add(_getStatusButton(false, player: activePlayer));
              }
              setState(() {});
            },
            time: 10),
      ),
    );
  }
}
