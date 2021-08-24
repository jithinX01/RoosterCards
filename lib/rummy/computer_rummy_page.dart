import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rooster_cards/proto/game_msg.pb.dart';
import 'package:rooster_cards/rummy/computer_rummy_agent.dart';
import 'package:rooster_cards/rummy/rummy_local_client.dart';
import 'package:rooster_cards/rummy/rummy_local_server.dart';
import 'package:rooster_cards/rummy/rummy_play.dart';
import 'package:rooster_cards/utilities/global_user_data_info.dart';

enum ComputerRummyState {
  INIT,
  WAITING,
  PROGRESS,
}

class ComputerRummyPage extends StatefulWidget {
  @override
  _ComputerRummyPageState createState() => _ComputerRummyPageState();
}

class _ComputerRummyPageState extends State<ComputerRummyPage> {
  RummyLocalServer? _rummyLocalServer;
  RummyLocalClient? _rummyLocalClient;
  ComputerRummyState _rummyState = ComputerRummyState.INIT;
  ComputerRummyAgent _computerRummyAgent = ComputerRummyAgent();
  late StreamSubscription _streamSubscription;
  late StartTournament _startTournament;
  int _code = 0;

  @override
  Widget build(BuildContext context) {
    return _getScreen();
  }

  @override
  void initState() {
    _initSettings();
    super.initState();
  }

  @override
  void dispose() {
    if (_rummyState.index >= ComputerRummyState.WAITING.index)
      _streamSubscription.cancel();
    _rummyLocalClient?.dispose();
    _rummyLocalServer?.dispose();
    super.dispose();
    print("dispose");
  }

  void _initSettings() {
    _rummyLocalServer = RummyLocalServer();
    _rummyLocalClient = RummyLocalClient(
        initDiscovery: false,
        onConnected: (val) {
          _rummyState = ComputerRummyState.WAITING;
          setState(() {});
          /*
            _rummyLocalClient
                .sendMessage(_getGameInitMessage().writeToBuffer());
            */
        });
    _computerRummyAgent.init();
  }

  Widget _getScreen() {
    switch (_rummyState) {
      case ComputerRummyState.INIT:
        return _getLoadingPage();
      case ComputerRummyState.WAITING:
        _rummyLocalClient!.sendMessage(_getGameInitMessage().writeToBuffer());
        _streamSubscription = _rummyLocalClient!.channel.stream.listen(null);
        _streamSubscription.onData(_onData);

        return _getLoadingPage();
      case ComputerRummyState.PROGRESS:
        return _getRummyPlay();
      default:
        return _getLoadingPage();
    }
  }

  Widget _getLoadingPage() {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(top: 32),
                child: Text(
                  "Initializing game",
                  textAlign: TextAlign.center,
                )),
            Container(
              padding: const EdgeInsets.only(top: 64),
              child: CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }

  Widget _getRummyPlay() {
    return RummyPlay(
      channel: _rummyLocalClient!.channel,
      streamSubscription: _streamSubscription,
      startTournament: _startTournament,
      withComputer: true,
    );
  }

  GameMessageClient _getGameInitMessage() {
    GameMessageClient gmc = GameMessageClient();
    InitStart initStart = InitStart();
    initStart.gameType = GameType.RUMMY;
    initStart.tournamentName = "System Fight";
    //initStart.playerName = "SomePlayer";
    initStart.playerName = UserDataInfo.of(context).userInfo.name;
    initStart.noOfDeck = 1;
    initStart.noOfPlayers = 2;
    initStart.noOfRounds = 1;
    gmc.initStart = initStart;
    return gmc;
  }

  void _onData(data) {
    GameMessageServer gms = GameMessageServer.fromBuffer(data);
    _handleServerMessage(gms);
  }

  void _handleServerMessage(GameMessageServer gms) {
    switch (gms.whichPayLoad()) {
      case GameMessageServer_PayLoad.initStartStat:
        return _handleInitStartStat(gms.initStartStat);
      case GameMessageServer_PayLoad.startTournament:
        return _handleStartTournament(gms.startTournament);
      default:
    }
  }

  void _handleInitStartStat(InitStartStat initStartStat) {
    _code = initStartStat.tournamentId;
    _computerRummyAgent.join(_code);
  }

  void _handleStartTournament(StartTournament startTournament) {
    _startTournament = startTournament;
    _rummyState = ComputerRummyState.PROGRESS;
    setState(() {});
  }
}
