import 'dart:async';
import 'dart:math';

import 'package:rooster_cards/proto/game_msg.pb.dart';
import 'package:rooster_cards/rummy/find_melds.dart';
import 'package:rooster_cards/rummy/rummy_local_client.dart';
import 'package:rooster_cards/rummy/rummy_user_action.dart';

List<String> roboNames = ["Rooster", "Robo", "Spider", "Chandler", "Rock"];

class ComputerRummyAgent {
  RummyLocalClient? _rummyLocalClient;
  late StreamSubscription _streamSubscription;
  StartTournament _tournamentData = StartTournament();
  var _meld = {};
  Timer _t = Timer(Duration(microseconds: 10), () {});

  void init() {
    _rummyLocalClient = RummyLocalClient(
        initDiscovery: false,
        onConnected: (val) {
          print("Agent connected");
        });
  }

  void join(var code) {
    _rummyLocalClient!.sendMessage(_getGameJoinMessage(code).writeToBuffer());
    _streamSubscription = _rummyLocalClient!.channel.stream.listen(null);
    _streamSubscription.onData(_onData);
  }

  void dispose() {
    _t.cancel();
    _rummyLocalClient?.dispose();
  }

  GameMessageClient _getGameJoinMessage(var code) {
    GameMessageClient gmc = GameMessageClient();
    roboNames.shuffle();
    gmc.join = Join(
        playerName: roboNames.first,
        //playerName: "JoinPlayer",
        tournamentId: code);

    return gmc;
  }

  void _onData(data) {
    GameMessageServer gms = GameMessageServer.fromBuffer(data);
    _handleServerMessage(gms);
  }

  void _handleServerMessage(GameMessageServer gms) {
    switch (gms.whichPayLoad()) {
      case GameMessageServer_PayLoad.gameServerUpdate:
        _handleGameServerUpdate(gms.gameServerUpdate);
        break;
      case GameMessageServer_PayLoad.startTournament:
        _handleStartTournament(gms.startTournament);
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
        default:
          print(gmUpdate.whichUpdate());
      }
    } else {
      print("Something wrong with Rummy gms update");
    }
  }

  void _handleActiveRPS(ActiveRummyPlayerStat activeRummyPlayerStat) {
    print("next card");
    print(activeRummyPlayerStat.nextCard);
    _tournamentData.nextCard = activeRummyPlayerStat.nextCard;
    RummyUserAction rummyUserAction =
        getUserAction(_meld, activeRummyPlayerStat.nextCard);
    if (_t.isActive) {
      _t.cancel();
    }
    _t = Timer(Duration(seconds: random(10, 20)), () {
      _handleUserAction(rummyUserAction);
      print("after replace $_meld");
      print(_tournamentData.cards);
    });
  }

  void _handleStartTournament(StartTournament startTournament) {
    _tournamentData = startTournament;
    findMelds(List.from(_tournamentData.cards), _meld);
    print(_meld);
  }

  int random(min, max) {
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }

  void _handleTournamentOver(TournamentOver tournamentOver) {}

  void _handleUserAction(RummyUserAction rummyUserAction) {
    switch (rummyUserAction.rUserAction) {
      case RUserAction.DISCARD:
        print("Discarded ${rummyUserAction.newCard}");
        GameMessageClient gmc = GameMessageClient(
          clientGameStat: ClientGameStat(
            playerId: _tournamentData.yourId,
            tournamentId: _tournamentData.tournamentId,
            discardCard: DiscardCard(
              card: rummyUserAction.newCard,
            ),
          ),
        );
        _rummyLocalClient?.channel.sink.add(gmc.writeToBuffer());
        break;
      case RUserAction.REPLACE:
        print("before replace $_meld");
        _tournamentData.cards.remove(rummyUserAction.oldCard);
        _tournamentData.cards.add(rummyUserAction.newCard);
        _tournamentData.cards.sort();
        _meld = {};
        findMelds(List.from(_tournamentData.cards), _meld);

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
        _rummyLocalClient?.channel.sink.add(gmc.writeToBuffer());
        break;
      default:
    }
  }
}
