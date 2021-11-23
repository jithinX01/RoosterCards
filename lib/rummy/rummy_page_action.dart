import 'package:flutter/material.dart';
import 'package:rooster_cards/proto/game_msg.pb.dart';
import 'package:rooster_cards/rummy/rummy_init.dart';
import 'package:rooster_cards/rummy/rummy_join.dart';
import 'package:rooster_cards/rummy/rummy_local_client.dart';
import 'package:rooster_cards/rummy/rummy_local_server.dart';
import 'package:rooster_cards/rummy/init_tournament_settings.dart';
import 'package:rooster_cards/rummy/rummy_play.dart';
import 'package:rooster_cards/rummy/waiting_screen.dart';
import 'dart:async';

import 'package:rooster_cards/utilities/global_user_data_info.dart';

enum RummyState {
  START,
  JOIN,
  WAITING,
  PROGRESS,
  END_GAME,
  BREAK,
  END,
}
enum RummyAction {
  START,
  JOIN,
}

class RummyPageAction extends StatefulWidget {
  final RummyAction rummyAction;
  RummyPageAction({Key? key, required this.rummyAction}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _RummyPageActionState createState() => _RummyPageActionState();
}

class _RummyPageActionState extends State<RummyPageAction> {
  late RummyState _rummyState;

  RummyLocalServer? _rummyLocalServer;
  RummyLocalClient? _rummyLocalClient;
  late InitTournamentSettings _ts;
  late StartTournament _startTournament;
  late StreamSubscription _streamSubscription;
  int _code = 0;

  @override
  Widget build(BuildContext context) {
    return _getScreen(_rummyState);
  }

  @override
  void initState() {
    super.initState();
    switch (widget.rummyAction) {
      case RummyAction.START:
        _rummyState = RummyState.START;
        _ts = InitTournamentSettings();
        break;
      case RummyAction.JOIN:
        _rummyState = RummyState.JOIN;
        break;
    }
  }

  @override
  void dispose() {
    if (_rummyState.index >= RummyState.WAITING.index)
      _streamSubscription.cancel();
    _rummyLocalClient!.dispose();
    if (widget.rummyAction == RummyAction.START) _rummyLocalServer!.dispose();
    super.dispose();
    //rprint("dispose");
  }

  Widget _getScreen(var state) {
    switch (state) {
      case RummyState.START:
        return RummyInit(onChanged: (val) {
          //print("count $val");
          _ts = val;
          //_ts.logInfo();

          _initLocalServer();
          _rummyLocalServer!.init().then((val){
            _connectToServer(initDiscovery: false);
          });
          
        });
      case RummyState.JOIN:
        return RummyJoin(onChanged: (val) {
          //rprint("count $val");
          _code = val;
          //for testing with emulator enable this.
          //_connectToServer(initDiscovery: false);
          _connectToServer();
        });
      case RummyState.WAITING:
        _rummyLocalClient!.sendMessage(_getMessage().writeToBuffer());
        _streamSubscription = _rummyLocalClient!.channel.stream.listen(null);
        return WaitingScreen(
          onGameStart: (val) {
            _startTournament = val;
            //print("Game is ready to start");
            //rprint(_startTournament.cards);
            _rummyState = RummyState.PROGRESS;
            setState(() {});
          },
          channel: _streamSubscription,
          initedPlayer: widget.rummyAction == RummyAction.START,
        );
      case RummyState.PROGRESS:
        return RummyPlay(
            channel: _rummyLocalClient!.channel,
            streamSubscription: _streamSubscription,
            startTournament: _startTournament);
    }
    return Container();
  }

  void _initLocalServer() {
    _rummyLocalServer = RummyLocalServer();
  }
  void _connectToServer({bool initDiscovery=true}) {
    _rummyLocalClient = RummyLocalClient(
              initDiscovery: initDiscovery,
              onConnected: (val) {
                _rummyState = RummyState.WAITING;
                setState(() {});
              });
  }

  GameMessageClient _getMessage() {
    switch (widget.rummyAction) {
      case RummyAction.START:
        return _getGameInitMessage();
      case RummyAction.JOIN:
        return _getGameJoinMessage();
    }
  }

  GameMessageClient _getGameInitMessage() {
    GameMessageClient gmc = GameMessageClient();
    InitStart initStart = InitStart();
    initStart.gameType = GameType.RUMMY;
    initStart.tournamentName = _ts.tournamentName;
    //initStart.playerName = "SomePlayer";
    initStart.playerName = UserDataInfo.of(context).userInfo.name;
    initStart.noOfDeck = _ts.cs.noOfDeck;
    initStart.noOfPlayers = _ts.cs.noOfPlayers;
    initStart.noOfRounds = _ts.cs.noOfRounds;
    initStart.coins = _ts.cs.coins;
    initStart.rummyInitData = RummyInitData();
    initStart.rummyInitData.maxPoint = _ts.cs.maxPoints;
    initStart.rummyInitData.maxPointGame = _ts.cs.maxPointGame;
    gmc.initStart = initStart;
    return gmc;
  }

  GameMessageClient _getGameJoinMessage() {
    GameMessageClient gmc = GameMessageClient();

    gmc.join = Join(
        playerName: UserDataInfo.of(context).userInfo.name,
        //playerName: "JoinPlayer",
        tournamentId: _code);

    return gmc;
  }
}
