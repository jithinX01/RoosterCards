import 'dart:async';

import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:rooster_cards/cards/boxofcards.dart';
import 'package:rooster_cards/cards/playing_card.dart';
import 'package:rooster_cards/proto/tournament_data.pb.dart';
import 'dart:math';

class GameLoserCard extends StatefulWidget {
  final int time;
  final String player;
  final String round;
  final Color c;
  final IconData icon;
  final AfterWinCards afterWinCards;
  final Map points;

  GameLoserCard({
    required this.time,
    required this.player,
    required this.round,
    this.c = Colors.green,
    this.icon = Icons.military_tech,
    required this.afterWinCards,
    required this.points,
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
    AutoOrientation.landscapeAutoMode();
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
    return SingleChildScrollView(
        child: Container(
      //width: 400,
      //height: 500,
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      decoration: _getDecoration(c: c),
      child: Column(
        //clipBehavior: Clip.none,
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
          ),
          _getCardAndPts(),
        ],
      ),
    ));
  }

  Widget _getCardAndPts() {
    List<Widget> L = [];
    widget.afterWinCards.playerCards.forEach((player, playerCard) {
      print("${widget.points[player]}Pts");
      print("player");
      L.add(Column(
        children: [
          Text(player,
              style: TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              )),
          Text("${widget.points[player]}Pts",
              style: TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              )),
          Container(
              child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              //width: 2000,
              //height: 100,
              /*
              child: Transform.scale(
                scale: 1,
              */
              child: _getCardStack(playerCard.cards),
              /*
              ),
              */
            ),
          )),
          /*Text(_getUTFCards(playerCard.cards),
                  style: TextStyle(
                    fontSize: 128,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ))),
              */
        ],
      ));
    });
    return Container(
      child: Column(
        children: L,
      ),
    );
  }

  String _getUTFCards(List<int> cards) {
    String scards = " ";
    cards.forEach((card) {
      scards += UTFPACK[card];
    });
    print(scards);
    return scards;
  }

  Color _getColor(Suit suit) {
    if (suit == Suit.SPADE || suit == Suit.CLUB) {
      return Colors.black;
    } else if (suit == Suit.HEART || suit == Suit.DIAMOND) {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }

  Widget _getPlayCard(PCardInfo pCardInfo) {
    return Container(
      width: 90,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(7.0),
        boxShadow: [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
              child: Text(pCardInfo.val,
                  style: TextStyle(
                    fontSize: 32,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    color: _getColor(pCardInfo.suit),
                  ))),
          Positioned(
              child: Align(
                  child: Text(pCardInfo.strUtf,
                      style: TextStyle(
                        fontSize: 32,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      )))),
        ],
      ),
    );
  }

  Widget _getCardStack(List<int> l) {
    var start = 1.0;
    List<Widget> wl = List<Widget>.generate(l.length, (int index) {
      return Positioned.fill(
        child: _getPlayCard(PACK[l[index]]),
        right: index * start,
        //top: 60,
      );
    });

    return Container(
      //height: l.length * 100.0 + 600,
      //padding: const EdgeInsets.only(top: 32),
      width: l.length * 91,
      child: Row(
        //alignment: Alignment.center,
        children: wl,
      ),
    );
  }
}

AfterWinCards getData() {
  PlayerCard p1 = PlayerCard(
    cards: [13, 14, 15, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38],
  );
  PlayerCard p2 = PlayerCard(
    cards: [41, 42, 43, 11, 23, 25, 48, 50, 8, 19, 3, 1, 27],
  );

  Map<String, PlayerCard> mp = {};
  mp["player1"] = p1;
  mp["player2"] = p2;

  AfterWinCards afterWinCards = AfterWinCards(
    playerCards: mp,
  );
  return afterWinCards;
}

Map<dynamic, dynamic> getPts() {
  var mp = {};
  mp["player1"] = 0;
  mp["player2"] = 74;
  return mp;
}
