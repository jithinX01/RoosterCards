import 'package:flutter/material.dart';
import 'package:rooster_cards/cards/boxofcards.dart';

import 'package:rooster_cards/proto/tournament_data.pb.dart';

enum PlayerStat {
  WINNER,
  LOSER,
}

class GameWinCard extends StatelessWidget {
  final int time;
  final String player;
  final String round;
  final Color c;
  final IconData icon;
  final AfterWinCards afterWinCards;
  final Map points;
  final PlayerStat stat;

  GameWinCard({
    required this.stat,
    this.time = 0,
    this.player = "You",
    required this.round,
    this.c = Colors.green,
    this.icon = Icons.military_tech,
    required this.afterWinCards,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        //top: 20,
        child: Align(
            alignment: Alignment.center,
            child: Container(
              //height: 400,
              child: _getCard(),
            )));
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

  Widget _getCard() {
    return SingleChildScrollView(
        child: Container(
      width: 500,
      //height: 500,
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      decoration: _getDecoration(c: c),
      child: Column(
        //clipBehavior: Clip.none,
        mainAxisAlignment: MainAxisAlignment.center,
        children: _getWidgetList(),
      ),
    ));
  }

  List<Widget> _getWidgetList() {
    List<Widget> wl = [];
    wl.addAll([
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
    ]);

    if (stat == PlayerStat.WINNER) {
      wl.addAll([
        Text(
          "WINNER WINNER ROOSTER DINNER",
          style: TextStyle(
            fontSize: 24,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
          ),
        )
      ]);
    } else if (stat == PlayerStat.LOSER) {
      wl.addAll([
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
      ]);
    }
    wl.add(_getCardAndPts());

    return wl;
  }

  Widget _getCardAndPts() {
    List<Widget> L = [];
    afterWinCards.playerCards.forEach((player, playerCard) {
      print("${points[player]}Pts");
      print("player");
      L.add(Column(
        children: [
          Text(player,
              style: TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              )),
          Text("${points[player]}Pts",
              style: TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              )),
          Container(
              child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              child: _getCardStack(playerCard.cards),
            ),
          )),
        ],
      ));
    });
    return Container(
      child: Column(
        children: L,
      ),
    );
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
    //var start = 1.0;
    List<Widget> wl = List<Widget>.generate(l.length, (int index) {
      return _getPlayCard(PACK[l[index]]);
      /*
      return Positioned.fill(
        child: _getPlayCard(PACK[l[index]]),
        right: index * start,
      );
      */
    });

    return Container(
      width: l.length * 91,
      child: Row(
        children: wl,
      ),
    );
  }
}
