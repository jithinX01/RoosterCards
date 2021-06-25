import 'package:rooster_cards/proto/game_msg.pb.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'dart:math';

random(min, max) {
  var rn = new Random();
  return min + rn.nextInt(max - min);
}

class GameHandler {
  var tournamentMap = Map();

  void handleMessage(var message, WebSocketChannel websocket) {
    GameMessageClient gmc = GameMessageClient.fromBuffer(message);
    switch (gmc.whichPayLoad()) {
      case GameMessageClient_PayLoad.initStart:
        break;
      default:
    }
  }

  void handlInitStart(InitStart initStart) {
    print(initStart.gameType);
  }
}
