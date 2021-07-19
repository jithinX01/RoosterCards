import 'dart:async';

import 'package:flutter/material.dart';

class GameLoserCard extends StatefulWidget {
  final int time;
  final String player;
  final String round;
  final Color c;
  final IconData icon;

  GameLoserCard({
    required this.time,
    required this.player,
    required this.round,
    this.c = Colors.green,
    this.icon = Icons.military_tech,
  });
  @override
  _GameLoserCardState createState() => _GameLoserCardState();
}

class _GameLoserCardState extends State<GameLoserCard> {
  bool _visible = true;
  bool _fromTimer = false;
  late Timer _t;
  /*
  @override
  initState() {
    super.initState();
  }
  */
  @override
  void dispose() {
    super.dispose();
    if (_t.isActive) _t.cancel();
  }

  @override
  Widget build(BuildContext context) {
    if (!_fromTimer) {
      _visible = true;
      _t = Timer(Duration(seconds: widget.time), () {
        setState(() {
          _visible = false;
          _fromTimer = true;
        });
      });
    } else {
      _fromTimer = false;
    }

    return Visibility(
      visible: _visible,
      child: Positioned.fill(
          //top: 20,
          child: Align(
        alignment: Alignment.center,
        child: _getCard(widget.player, widget.round, widget.c, widget.icon),
      )),
    );
  }

  Decoration _getDecoration({Color c = Colors.grey}) {
    return BoxDecoration(
      color: c,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(7.0),
      boxShadow: [
        BoxShadow(
          color: Colors.blue,
          blurRadius: 20.0,
        ),
      ],
    );
  }

  Widget _getCard(String player, String round, Color c, IconData icon) {
    return Container(
      width: 300,
      height: 250,
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      decoration: _getDecoration(c: c),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 64,
          ),
          Text(
            round,
            style: TextStyle(
              fontSize: 24,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            player,
            style: TextStyle(
              fontSize: 32,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Won",
            style: TextStyle(
              fontSize: 24,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
