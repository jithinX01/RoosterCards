import 'package:rooster_cards/game_handler/tournament.dart';
import 'package:rooster_cards/proto/game_msg.pb.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'dart:math';

random(min, max) {
  var rn = new Random();
  return min + rn.nextInt(max - min);
}

class GameHandler {
  var tournamentMap = Map<int, Tournament>();
  var connectionMap = Map<WebSocketChannel, int>();

  void handleMessage(var message, WebSocketChannel wc) {
    GameMessageClient gmc = GameMessageClient.fromBuffer(message);
    //rprint(gmc.whichPayLoad());
    switch (gmc.whichPayLoad()) {
      case GameMessageClient_PayLoad.initStart:
        _handlInitStart(gmc.initStart, wc);
        break;
      case GameMessageClient_PayLoad.join:
        _handleJoin(gmc.join, wc);
        break;
      case GameMessageClient_PayLoad.clientGameStat:
        _handleClientGameStat(gmc.clientGameStat, wc);
        break;
      default:
    }
  }

  void _handlInitStart(InitStart initStart, WebSocketChannel wc) {
    //rprint(initStart.gameType);
    var tournamentId = random(1000, 9999);
    while (tournamentMap.containsKey(tournamentId)) {
      tournamentId = random(1000, 9999);
    }
    tournamentMap[tournamentId] = _getTournament(initStart, wc, tournamentId);
    connectionMap[wc] = tournamentId;
  }

  void _handleJoin(Join join, WebSocketChannel wc) {
    //rprint(join.tournamentId);
    if (tournamentMap.containsKey(join.tournamentId)) {
      tournamentMap[join.tournamentId]?.handleJoin(join, wc);
    } else {
      //error case
      _handleError(wc, 101, "No Tournament Found");
    }
  }

  void _handleClientGameStat(
      ClientGameStat clientGameStat, WebSocketChannel wc) {
    if (tournamentMap.containsKey(clientGameStat.tournamentId)) {
      tournamentMap[clientGameStat.tournamentId]
          ?.handleClientGameStat(clientGameStat, wc);
    } else {
      //error case
      _handleError(wc, 101, "No Tournament Found");
    }
  }

  void _handleError(WebSocketChannel wc, int errorCode, String errorMessage) {
    GameMessageServer gms = GameMessageServer(
        errorStat: ErrorStat(errorCode: errorCode, errorMessage: errorMessage));
    wc.sink.add(gms.writeToBuffer());
  }

  Tournament _getTournament(
      InitStart initStart, WebSocketChannel wc, int tournamentId) {
    switch (initStart.gameType) {
      case GameType.RUMMY:
        return RummyTournament(initStart, wc, tournamentId);
      default:
        return Tournament(initStart, wc, tournamentId);
    }
  }
}
