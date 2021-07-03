import 'package:flutter/material.dart';
import 'package:rooster_cards/cards/boxofcards.dart';
import 'package:rooster_cards/cards/playing_card.dart';
import 'package:rooster_cards/proto/game_msg.pb.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:auto_orientation/auto_orientation.dart';

//import 'package:rooster_cards/rummy/waiting_screen.dart';

class RummyPlay extends StatefulWidget {
  final WebSocketChannel channel;
  final StartTournament startTournament;

  RummyPlay({Key? key, required this.channel, required this.startTournament})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _RummyPlayState createState() => _RummyPlayState();
}

class _RummyPlayState extends State<RummyPlay> {
  @override
  Widget build(BuildContext context) {
    //return WaitingScreen();
    AutoOrientation.landscapeAutoMode();
    return Scaffold(
      body: Container(
        child: _getScreen(),
        //padding: const EdgeInsets.only(top: 32),
      ),
    );
  }

  Widget _getScreen() {
    return Stack(children: <Widget>[
      _getPlayingCards(),
      _getStatusButton(),
      _getControlButton(),
      _getPopCard(),
    ]);
  }

  Widget _getPlayingCards() {
    return Container(
        //padding: const EdgeInsets.only(top: 32),
        child: BoxOfCards().createScrollableStack(widget.startTournament.cards,
            vertical: false));
  }

  Widget _getStatusButton() {
    return Positioned(
      top: 20,
      left: 20,
      child: FloatingActionButton.extended(
        icon: Icon(Icons.router_rounded),
        label: Text(
          widget.startTournament.round.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        heroTag: "ggbb",
        onPressed: () {
          print("pressed");
        },
      ),
    );
  }

  Widget _getControlButton() {
    return Positioned.fill(
      bottom: 10,
      left: 100,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: FloatingActionButton.extended(
          icon: Icon(Icons.router_rounded),
          label: Text(
            widget.startTournament.round.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          backgroundColor: Colors.green,
          foregroundColor: Colors.black,
          heroTag: "ggbb",
          onPressed: () {
            print("pressed");
          },
        ),
      ),
    );
  }

  Widget _getPopCard() {
    return Positioned(
        top: 80,
        right: -50,
        child: Stack(
          children: [
            PlayingCard(PCardInfo("K", Suit.SPADE)),
            Positioned(
                right: 55,
                bottom: 170,
                child: FloatingActionButton(onPressed: () {})),
            Positioned(
                left: 10,
                bottom: 170,
                child: FloatingActionButton(onPressed: () {})),
          ],
        ));
  }
}
