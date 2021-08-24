import 'dart:async';

import 'package:rooster_cards/proto/game_msg.pb.dart';
import 'package:rooster_cards/rummy/rummy_local_client.dart';

class ComputerRummyAgent {
  RummyLocalClient? _rummyLocalClient;
  late StreamSubscription _streamSubscription;
  StartTournament _tournamentData = StartTournament();

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
    _rummyLocalClient?.dispose();
  }

  GameMessageClient _getGameJoinMessage(var code) {
    GameMessageClient gmc = GameMessageClient();

    gmc.join = Join(
        playerName: "Computer",
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
  }

  void _handleStartTournament(StartTournament startTournament) {
    _tournamentData = startTournament;
  }

  void _handleTournamentOver(TournamentOver tournamentOver) {}
}
