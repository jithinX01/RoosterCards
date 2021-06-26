import 'package:flutter/material.dart';
import 'package:rooster_cards/proto/game_msg.pb.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WaitingScreen extends StatefulWidget {
  final ValueChanged<bool> onGameStart;
  final WebSocketChannel channel;

  WaitingScreen({Key? key, required this.onGameStart, required this.channel})
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          l,
        ),
        onPressed: () {
          setState(() {
            l = "Clicked";
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        //padding: const EdgeInsets.only(top: 64),
        //heightFactor: 10,
        child: StreamBuilder(
          builder: _getWidget,
          stream: widget.channel.stream,
        ),
      ),
    );
  }

  Widget _getWidget(BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    if (snapshot.hasData) {
      print("data from server");
      print(snapshot.data);
      GameMessageServer gms = GameMessageServer.fromBuffer(snapshot.data);
      print(gms.whichPayLoad());
      return _handleServerMessage(gms);
    } else {
      return _initWidget();
    }
  }

  Widget _handleServerMessage(GameMessageServer gms) {
    switch (gms.whichPayLoad()) {
      case GameMessageServer_PayLoad.initStartStat:
        return _handleInitStartStat(gms.initStartStat);
      case GameMessageServer_PayLoad.joinProgress:
        return _handleJoinProgress(gms.joinProgress);
    }
    return _initWidget();
  }

  Widget _handleInitStartStat(InitStartStat initStartStat) {
    List<Widget> wList = List.empty(growable: true);
    wList.add(Container(
        padding: const EdgeInsets.only(top: 64),
        child: Text(
          "TOURNMENT CODE",
          textAlign: TextAlign.center,
        )));
    wList.add(Container(
        padding: const EdgeInsets.only(top: 32),
        child: Text(
          initStartStat.tournamentId.toString(),
          textAlign: TextAlign.center,
        )));
    wList.addAll(_initListWidgets());
    return Column(
      children: wList,
    );
  }

  Widget _handleJoinProgress(JoinProgress joinProgress) {
    return Column();
  }

  Widget _initWidget() {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: _initListWidgets(),
    );
  }

  List<Widget> _initListWidgets() {
    return <Widget>[
      Container(
          padding: const EdgeInsets.only(top: 32),
          child: Text(
            "WAITING FOR PLAYERS",
            textAlign: TextAlign.center,
          )),
      Container(
        padding: const EdgeInsets.only(top: 64),
        child: CircularProgressIndicator(),
      )
    ];
  }
}
