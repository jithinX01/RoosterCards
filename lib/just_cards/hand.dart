import 'dart:math';

//import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rooster_cards/cards/boxofcards.dart';
import 'package:rooster_cards/cards/playing_card.dart';

class Hand extends StatefulWidget {
  @override
  _HandState createState() => _HandState();
}

class _HandState extends State<Hand> {
  List<int> _cards = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
  ScrollController _controller = new ScrollController();
  @override
  Widget build(BuildContext context) {
    //AutoOrientation.landscapeAutoMode();

    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            child: RotateCards(
                controller: _controller,
                child: Container(
                  //height: 1000,
                  child: _getCards(),
                ))),
      ),
    );
  }

  Widget _getCards() {
    double start = 50;
    List<Widget> wl = List<Widget>.generate(_cards.length, (int index) {
      var angle = -pi / (180 / (65 - (index * 10)));
      //rprint("Angle $angle");
      return Positioned(
          left: (1 * 500) + start,
          bottom: -150,
          child: Container(
              child: Transform.rotate(
            alignment: Alignment.bottomLeft,
            angle: angle,
            child: PlayingCard(PACK[_cards[index]]),
          )));
    });

    return Container(
      //width: _cards.length * 100.0 + 500,
      width: _cards.length * 80,
      height: 1000,
      //width: l.length * 100.0 + 300,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        //alignment: Alignment.center,
        children: wl,
      ),
    );
  }
}

class RotateCards extends StatefulWidget {
  RotateCards({Key? key, required this.controller, required this.child})
      : super(key: key);

  final ScrollController controller;
  final Widget child;

  @override
  _RotateCardsState createState() => _RotateCardsState();
}

class _RotateCardsState extends State<RotateCards> {
  get offset => widget.controller.hasClients ? widget.controller.offset : 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.controller,
        builder: (BuildContext context, Widget? child) {
          //rprint("offset $offset");
          return Transform.rotate(
              alignment: Alignment.bottomCenter,
              //origin: Offset(100, 0),
              angle: ((pi * offset) / -1024),
              child: widget.child);
        });
  }
}
