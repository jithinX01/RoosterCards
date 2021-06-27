import 'package:flutter/material.dart';
import 'package:rooster_cards/proto/game_msg.pb.dart';

import 'package:rooster_cards/rummy/rummy_join.dart';
import 'package:rooster_cards/rummy/rummy_local_client.dart';
import 'package:rooster_cards/rummy/waiting_screen.dart';

enum RummyState {
  INIT_JOIN,
  WAITING,
  PROGRESS,
  END_GAME,
  BREAK,
  END,
}

class JoinRummyPage extends StatefulWidget {
  JoinRummyPage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _JoinRummyPageState createState() => _JoinRummyPageState();
}

class _JoinRummyPageState extends State<JoinRummyPage> {
  var _rummyState = RummyState.INIT_JOIN;

  dynamic _rummyLocalClient;
  int _code = 0;
  @override
  Widget build(BuildContext context) {
    return _getScreen(_rummyState);
  }

  @override
  void dispose() {
    _rummyLocalClient.dispose();

    super.dispose();
    print("dispose");
  }

  Widget _getScreen(var state) {
    switch (state) {
      case RummyState.INIT_JOIN:
        return RummyJoin(onChanged: (val) {
          //print("count $val");
          _code = val;

          _rummyLocalClient = RummyLocalClient(onConnected: (val) {
            _rummyState = RummyState.WAITING;
            setState(() {});
            _rummyLocalClient
                .sendMessage(_getGameJoinMessage().writeToBuffer());
          });
        });
      case RummyState.WAITING:
        return WaitingScreen(
            onGameStart: (val) {}, channel: _rummyLocalClient.channel);
    }
    return Container();
  }

  GameMessageClient _getGameJoinMessage() {
    GameMessageClient gmc = GameMessageClient();

    gmc.join = Join(playerName: "JoinPlayer", tournamentId: _code);

    return gmc;
  }
}
