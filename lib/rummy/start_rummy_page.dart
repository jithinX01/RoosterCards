import 'package:flutter/material.dart';
import 'package:rooster_cards/proto/game_msg.pb.dart';
import 'package:rooster_cards/rummy/rummy_init.dart';
import 'package:rooster_cards/rummy/rummy_local_client.dart';
import 'package:rooster_cards/rummy/rummy_local_server.dart';
import 'package:rooster_cards/rummy/init_tournament_settings.dart';
import 'package:rooster_cards/rummy/rummy_play.dart';
import 'package:rooster_cards/rummy/waiting_screen.dart';
import 'dart:async';

enum RummyState {
  INIT,
  WAITING,
  PROGRESS,
  END_GAME,
  BREAK,
  END,
}

class StartRummyPage extends StatefulWidget {
  StartRummyPage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _StartRummyPageState createState() => _StartRummyPageState();
}

class _StartRummyPageState extends State<StartRummyPage> {
  var _rummyState = RummyState.INIT;
  dynamic _rummyLocalServer;
  dynamic _rummyLocalClient;
  InitTournamentSettings _ts = InitTournamentSettings();
  late StartTournament _startTournament;
  late StreamSubscription _streamSubscription;
  @override
  Widget build(BuildContext context) {
    return _getScreen(_rummyState);
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    _rummyLocalClient.dispose();
    _rummyLocalServer.dispose();
    super.dispose();
    //rprint("dispose");
  }

  Widget _getScreen(var state) {
    switch (state) {
      case RummyState.INIT:
        return RummyInit(onChanged: (val) {
          //print("count $val");
          _ts = val;
          _ts.logInfo();

          _initLocalServer();
          _rummyLocalClient = RummyLocalClient(onConnected: (val) {
            _rummyState = RummyState.WAITING;
            setState(() {});
            _rummyLocalClient
                .sendMessage(_getGameInitMessage().writeToBuffer());
          });
        });
      case RummyState.WAITING:
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
          initedPlayer: true,
        );
      case RummyState.PROGRESS:
        return RummyPlay(
            channel: _rummyLocalClient.channel,
            streamSubscription: _streamSubscription,
            startTournament: _startTournament);
    }
    return Container();
  }

  void _initLocalServer() {
    _rummyLocalServer = RummyLocalServer();
  }

  GameMessageClient _getGameInitMessage() {
    GameMessageClient gmc = GameMessageClient();
    InitStart initStart = InitStart();
    initStart.gameType = GameType.RUMMY;
    initStart.tournamentName = _ts.tournamentName;
    initStart.playerName = "SomePlayer";
    initStart.noOfDeck = _ts.cs.noOfDeck;
    initStart.noOfPlayers = _ts.cs.noOfPlayers;
    initStart.noOfRounds = _ts.cs.noOfRounds;
    gmc.initStart = initStart;
    return gmc;
  }
}
