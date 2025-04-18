import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rooster_cards/proto/game_msg.pb.dart';

import 'package:rooster_cards/rummy/rummy_join.dart';
import 'package:rooster_cards/rummy/rummy_local_client.dart';
import 'package:rooster_cards/rummy/rummy_play.dart';
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
  late StartTournament _startTournament;
  dynamic _rummyLocalClient;
  late StreamSubscription _streamSubscription;

  int _code = 0;
  @override
  Widget build(BuildContext context) {
    return _getScreen(_rummyState);
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    _rummyLocalClient.dispose();

    super.dispose();
    //rprint("dispose");
  }

  Widget _getScreen(var state) {
    switch (state) {
      case RummyState.INIT_JOIN:
        return RummyJoin(onChanged: (val) {
          //rprint("count $val");
          _code = val;

          _rummyLocalClient = RummyLocalClient(
              initDiscovery: false,
              onConnected: (val) {
                //rprint(val);
                //rprint(_rummyLocalClient);
                _rummyState = RummyState.WAITING;

                //_rummyLocalClient
                //    .sendMessage(_getGameJoinMessage().writeToBuffer());
                setState(() {});
              });
        });
      case RummyState.WAITING:
        _rummyLocalClient.sendMessage(_getGameJoinMessage().writeToBuffer());
        _streamSubscription = _rummyLocalClient.channel.stream.listen(null);
        return WaitingScreen(
          onGameStart: (val) {
            _startTournament = val;
            //print("Game is ready to start");
            //rprint(_startTournament.cards);
            _rummyState = RummyState.PROGRESS;
            setState(() {});
          },
          channel: _streamSubscription,
          initedPlayer: false,
        );
      case RummyState.PROGRESS:
        return RummyPlay(
            channel: _rummyLocalClient.channel,
            streamSubscription: _streamSubscription,
            startTournament: _startTournament);
    }
    return Container();
  }

  GameMessageClient _getGameJoinMessage() {
    GameMessageClient gmc = GameMessageClient();

    gmc.join = Join(playerName: "JoinPlayer", tournamentId: _code);

    return gmc;
  }
}
