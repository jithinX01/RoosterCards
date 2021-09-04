import 'package:flutter/material.dart';
import 'package:rooster_cards/cards/boxofcards.dart';
import 'dart:math';

class Invert extends StatelessWidget {
  final StatelessWidget w;
  Invert(this.w);
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.rotationZ(pi),
      alignment: Alignment.center,
      child: w,
    );
  }
}

class CardText extends StatelessWidget {
  final String val;
  final double size;
  final double width;
  final Color color;
  final TextAlign textAlign;
  CardText({
    Key? key,
    required this.val,
    required this.size,
    required this.color,
    this.width = 50.0,
    this.textAlign = TextAlign.left,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      //height: 300,
      //alignment: Alignment.bottomRight,
      child: Text(
        val,
        style: TextStyle(
          fontSize: size,
          color: color,
        ),
        textAlign: textAlign,
      ),
    );
  }
}

class CardIcon extends StatelessWidget {
  final double width;
  final double scale;
  final String asset;
  final AlignmentGeometry alignment;
  CardIcon({
    Key? key,
    required this.asset,
    required this.width,
    this.alignment = Alignment.center,
    this.scale = 2.5,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: alignment,
      child: Image.asset(
        asset,
        scale: scale,
      ),
    );
  }
}

class SuitIcon extends StatelessWidget {
  final double width;
  final double scale;
  final AlignmentGeometry alignment;
  final Suit suit;
  SuitIcon(this.suit, this.width, this.scale, this.alignment);
  @override
  Widget build(BuildContext context) {
    return CardIcon(
      width: width,
      alignment: alignment,
      asset: getSuit(suit),
      scale: scale,
    );
  }

  String getSuit(Suit suit) {
    switch (suit) {
      case Suit.CLUB:
        return 'images/club.png';
      case Suit.HEART:
        return 'images/heart.png';
      case Suit.DIAMOND:
        return 'images/diamond.png';
      case Suit.SPADE:
        return 'images/spade.png';
      case Suit.JOKER:
        return 'images/joker.png';
      case Suit.ROOSTER:
        return 'images/rooster.png';
      default:
        return 'images/spade.png';
    }
  }
}

Color getColor(Suit suit) {
  if (suit == Suit.SPADE || suit == Suit.CLUB) {
    return Colors.black;
  } else if (suit == Suit.HEART || suit == Suit.DIAMOND) {
    return Colors.red;
  } else {
    return Colors.black;
  }
}

class TextIcon extends StatelessWidget {
  final Suit suit;
  final String val;
  final double width;
  TextIcon(this.suit, this.val, {this.width = 50.0});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CardText(
        val: val,
        size: 44,
        color: getColor(suit),
        width: width,
      ),
      SuitIcon(suit, width, 2.7, Alignment.centerLeft),
    ]);
  }
}

class JokerTextIcon extends StatelessWidget {
  final Suit suit;
  final String val;
  final double width;
  JokerTextIcon(this.suit, this.val, {this.width = 50.0});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
          alignment: Alignment.centerLeft,
          //width: 300,
          child: CardText(
            val: val,
            size: 24,
            color: getColor(suit),
            width: 16,
            textAlign: TextAlign.center,
          )),
      //SuitIcon(suit, width, 2.7, Alignment.centerLeft),
    ]);
  }
}

class PlayingCard extends StatelessWidget {
  /*
  final Suit suit;
  final String val;
  */
  final PCardInfo pCardInfo;
  PlayingCard(this.pCardInfo);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 300,
      padding: const EdgeInsets.all(8.0),
      //color: Colors.white,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: _getCard(),
    );
  }

  Widget _getNormalCard() {
    return Stack(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextIcon(
          pCardInfo.suit,
          pCardInfo.val,
          width: 300,
        ),
        SuitIcon(pCardInfo.suit, 300, 1, Alignment.center),
        Invert(TextIcon(
          pCardInfo.suit,
          pCardInfo.val,
          width: 300,
        )),
      ],
    );
  }

  Widget _getJokerCard() {
    return Stack(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        JokerTextIcon(
          pCardInfo.suit,
          pCardInfo.val,
          width: 300,
        ),
        SuitIcon(pCardInfo.suit, 300, 1, Alignment.center),
        Invert(JokerTextIcon(
          pCardInfo.suit,
          pCardInfo.val,
          width: 300,
        )),
      ],
    );
  }

  Widget _getCard() {
    if (pCardInfo.suit == Suit.JOKER || pCardInfo.suit == Suit.ROOSTER) {
      return _getJokerCard();
    }
    return _getNormalCard();
  }
}
