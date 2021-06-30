import 'package:flutter/material.dart';
import 'package:rooster_cards/cards/boxofcards.dart';
import 'package:rooster_cards/proto/game_msg.pb.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

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

    return Container(
      child: BoxOfCards.createScrollableStack(widget.startTournament.cards),
    );
  }
}
