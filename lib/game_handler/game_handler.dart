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
    switch (gmc.whichPayLoad()) {
      case GameMessageClient_PayLoad.initStart:
        handlInitStart(gmc.initStart, wc);
        break;
      case GameMessageClient_PayLoad.join:
        break;
      default:
    }
  }

  void handlInitStart(InitStart initStart, WebSocketChannel wc) {
    print(initStart.gameType);
    var tournamentId = random(1000, 9999);
    while (tournamentMap.containsKey(tournamentId)) {
      tournamentId = random(1000, 9999);
    }
    tournamentMap[tournamentId] = Tournament(initStart, wc, tournamentId);
    connectionMap[wc] = tournamentId;
  }

  void handleJoin(Join join, WebSocketChannel wc) {
    if (tournamentMap.containsKey(join.tournamentId)) {}
  }
}
