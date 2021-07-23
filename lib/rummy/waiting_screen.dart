import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rooster_cards/proto/game_msg.pb.dart';

class WaitingScreen extends StatefulWidget {
  final ValueChanged<StartTournament> onGameStart;
  final StreamSubscription channel;
  final bool initedPlayer;

  WaitingScreen(
      {Key? key,
      required this.onGameStart,
      required this.channel,
      required this.initedPlayer})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _WaitingScreenState createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  String l = "Cancel";
  int _tournamentId = 0;
  int _playerId = -1;

  late Widget _w;

  //var _startTournament;

  @override
  void initState() {
    super.initState();
    _w = _initWidget();
    //widget.channel.stream.forEach(_onData);
    widget.channel.onData(_onData);
  }

  void _onData(data) {
    GameMessageServer gms = GameMessageServer.fromBuffer(data);
    _w = _handleServerMessage(gms);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          l,
        ),
        onPressed: () {
          Navigator.pop(context);
          /*
          setState(() {
            l = "Clicked";
          });
          */
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        //padding: const EdgeInsets.only(top: 64),
        //heightFactor: 10,
        child: _w,
      ),
    );
  }

  Widget _handleServerMessage(GameMessageServer gms) {
    switch (gms.whichPayLoad()) {
      case GameMessageServer_PayLoad.initStartStat:
        return _handleInitStartStat(gms.initStartStat);
      case GameMessageServer_PayLoad.joinStat:
        return _handleJoinStat(gms.joinStat);
      case GameMessageServer_PayLoad.joinProgress:
        return _handleJoinProgress(gms.joinProgress);
      case GameMessageServer_PayLoad.startTournament:
        return _handleStartTournament(gms.startTournament);
      default:
    }
    return _initWidget();
  }

  Widget _handleStartTournament(StartTournament startTournament) {
    //_startTournament = startTournament;
    Timer(Duration(milliseconds: 1000), () {
      //setState(() {});

      widget.onGameStart(startTournament);
    });
    print(startTournament.playerMap);

    //_subscription.cancel();
    return _initWidget(msg: "Starting");
  }

  //message replied from server when player start tournament.
  Widget _handleInitStartStat(InitStartStat initStartStat) {
    _tournamentId = initStartStat.tournamentId;
    _playerId = initStartStat.playerId;
    List<Widget> wList = List.empty(growable: true);
    wList.addAll(_tournamentCodeWidgets());
    wList.addAll(_initListWidgets());
    return Column(
      children: wList,
    );
  }

  //Server update the list of joined players
  Widget _handleJoinProgress(JoinProgress joinProgress) {
    List<Widget> wList = List.empty(growable: true);
    if (widget.initedPlayer) wList.addAll(_tournamentCodeWidgets());
    wList.addAll(_joinedPlayersWidget(joinProgress.players));
    wList.addAll(_initListWidgets());
    return Column(
      children: wList,
    );
  }

  List<Widget> _joinedPlayersWidget(List<String> players) {
    List<Widget> wList = List.empty(growable: true);

    players.forEach((player) {
      wList.add(Container(
          padding: const EdgeInsets.only(top: 32),
          child: Text(
            player + " Joined",
            textAlign: TextAlign.center,
          )));
    });
    return wList;
  }

  Widget _handleJoinStat(JoinStat joinStat) {
    _playerId = joinStat.playerId;
    return _initWidget();
  }

  Widget _initWidget({String msg = "WAITING FOR PLAYERS"}) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: _initListWidgets(msg: msg),
    );
  }

  List<Widget> _initListWidgets({String msg = "WAITING FOR PLAYERS"}) {
    return <Widget>[
      Container(
          padding: const EdgeInsets.only(top: 32),
          child: Text(
            msg,
            textAlign: TextAlign.center,
          )),
      Container(
        padding: const EdgeInsets.only(top: 64),
        child: CircularProgressIndicator(),
      )
    ];
  }

  List<Widget> _tournamentCodeWidgets() {
    return <Widget>[
      Container(
          padding: const EdgeInsets.only(top: 64),
          child: Text(
            _tournamentId.toString(),
            textAlign: TextAlign.center,
          )),
    ];
  }
}
