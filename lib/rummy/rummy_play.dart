import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rooster_cards/cards/boxofcards.dart';
import 'package:rooster_cards/cards/playing_card.dart';
import 'package:rooster_cards/proto/game_msg.pb.dart';
import 'package:rooster_cards/timer_button.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:auto_orientation/auto_orientation.dart';

//import 'package:rooster_cards/rummy/waiting_screen.dart';

class RummyPlay extends StatefulWidget {
  final WebSocketChannel channel;
  final StreamSubscription streamSubscription;
  final StartTournament startTournament;

  RummyPlay(
      {Key? key,
      required this.channel,
      required this.streamSubscription,
      required this.startTournament})
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
  List<Widget> _wl = List.empty(growable: true);
  late List<int> _playerCards;
  @override
  void initState() {
    super.initState();
    widget.streamSubscription.onData(_onData);
    _playerCards = List.from(widget.startTournament.cards, growable: true);
    _wl.add(_getPlayingCards());
    _wl.add(_getTimer());
  }

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

  void _onData(dynamic message) {}

  Widget _getScreen() {
    return Stack(
      children: _wl,
    );
  }

  Widget _getPlayingCards(
      {StackMode mode = StackMode.SWAP_MODE, int nextCard = -1}) {
    return Container(
        child: PlayerCardStack(
      cards: _playerCards,
      vertical: false,
      mode: mode,
      nextCard: nextCard,
      onUserAction: (val) {
        print(val.rUserAction);
      },
    ));
  }

  Widget _getStatusButton(bool active, {String player = "You"}) {
    return Positioned(
      top: 20,
      left: 20,
      child: FloatingActionButton.extended(
        icon: Icon(Icons.router_rounded),
        label: Text(
          active ? player : player,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: active ? Colors.green : Colors.red,
        foregroundColor: Colors.black,
        heroTag: "ggbb_status",
        onPressed: () {
          print("pressed");
        },
      ),
    );
  }

  /*
  Widget _getPopCard(int card) {
    return Positioned(
        top: 80,
        right: -50,
        child: Stack(
          children: [
            PlayingCard(PACK[card]),
            Positioned(
              right: 55,
              bottom: 170,
              child: FloatingActionButton.extended(
                onPressed: () {},
                label: Icon(Icons.check),
                backgroundColor: Colors.green,
                heroTag: "onAccept",
              ),
            ),
            Positioned(
                left: 10,
                bottom: 170,
                child: FloatingActionButton.extended(
                  onPressed: () {},
                  label: Icon(Icons.close),
                  backgroundColor: Colors.red,
                  heroTag: "onDiscard",
                )),
          ],
        ));
  }
  */
  Widget _getTimer() {
    return Positioned.fill(
      top: 20,
      child: Align(
        alignment: Alignment.topCenter,
        child: TimerButton(
            onEnd: () {
              _wl.removeLast();
              if (widget.startTournament.youStart) {
                _wl.clear();
                _wl.add(_getPlayingCards(
                    mode: StackMode.REPLACE_MODE,
                    nextCard: widget.startTournament.nextCard));
                _wl.add(_getStatusButton(true));
                //_wl.add(_getPopCard(widget.startTournament.nextCard));
              } else {
                String activePlayer = widget.startTournament
                        .playerMap[widget.startTournament.activePlayerId] ??
                    "";
                _wl.add(_getStatusButton(false, player: activePlayer));
              }
              setState(() {});
            },
            time: 60),
      ),
    );
  }
}
