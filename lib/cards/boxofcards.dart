import 'package:flutter/rendering.dart';
import 'package:rooster_cards/cards/playing_card.dart';

import 'package:flutter/material.dart';
import 'package:rooster_cards/rummy/rummy_user_action.dart';

const String _c = "club";
const String _d = "diamond";
const String _h = "heart";
const String _s = "spade";
const String _j = "joker";

enum Suit {
  CLUB,
  DIAMOND,
  HEART,
  SPADE,
  JOKER,
}

class PCardInfo {
  final String val;
  final Suit suit;
  String get strSuit {
    switch (suit) {
      case Suit.CLUB:
        return _c;
      case Suit.DIAMOND:
        return _d;
      case Suit.HEART:
        return _h;
      case Suit.SPADE:
        return _s;
      case Suit.JOKER:
        return _j;
      default:
        return "";
    }
  }

  const PCardInfo(this.val, this.suit);
}

const PACK = <PCardInfo>[
  PCardInfo("A", Suit.CLUB),
  PCardInfo("2", Suit.CLUB),
  PCardInfo("3", Suit.CLUB),
  PCardInfo("4", Suit.CLUB),
  PCardInfo("5", Suit.CLUB),
  PCardInfo("6", Suit.CLUB),
  PCardInfo("7", Suit.CLUB),
  PCardInfo("8", Suit.CLUB),
  PCardInfo("9", Suit.CLUB),
  PCardInfo("10", Suit.CLUB),
  PCardInfo("J", Suit.CLUB),
  PCardInfo("Q", Suit.CLUB),
  PCardInfo("K", Suit.CLUB),
  PCardInfo("A", Suit.DIAMOND),
  PCardInfo("2", Suit.DIAMOND),
  PCardInfo("3", Suit.DIAMOND),
  PCardInfo("4", Suit.DIAMOND),
  PCardInfo("5", Suit.DIAMOND),
  PCardInfo("6", Suit.DIAMOND),
  PCardInfo("7", Suit.DIAMOND),
  PCardInfo("8", Suit.DIAMOND),
  PCardInfo("9", Suit.DIAMOND),
  PCardInfo("10", Suit.DIAMOND),
  PCardInfo("J", Suit.DIAMOND),
  PCardInfo("Q", Suit.DIAMOND),
  PCardInfo("K", Suit.DIAMOND),
  PCardInfo("A", Suit.HEART),
  PCardInfo("2", Suit.HEART),
  PCardInfo("3", Suit.HEART),
  PCardInfo("4", Suit.HEART),
  PCardInfo("5", Suit.HEART),
  PCardInfo("6", Suit.HEART),
  PCardInfo("7", Suit.HEART),
  PCardInfo("8", Suit.HEART),
  PCardInfo("9", Suit.HEART),
  PCardInfo("10", Suit.HEART),
  PCardInfo("J", Suit.HEART),
  PCardInfo("Q", Suit.HEART),
  PCardInfo("K", Suit.HEART),
  PCardInfo("A", Suit.SPADE),
  PCardInfo("2", Suit.SPADE),
  PCardInfo("3", Suit.SPADE),
  PCardInfo("4", Suit.SPADE),
  PCardInfo("5", Suit.SPADE),
  PCardInfo("6", Suit.SPADE),
  PCardInfo("7", Suit.SPADE),
  PCardInfo("8", Suit.SPADE),
  PCardInfo("9", Suit.SPADE),
  PCardInfo("10", Suit.SPADE),
  PCardInfo("J", Suit.SPADE),
  PCardInfo("Q", Suit.SPADE),
  PCardInfo("K", Suit.SPADE),
  PCardInfo("joker", Suit.JOKER)
];

enum StackMode {
  SWAP_MODE,
  REPLACE_MODE,
}

class PlayerCardStack extends StatefulWidget {
  final List<int> cards;
  final bool vertical;
  final StackMode mode;
  final int nextCard;
  final ValueChanged<RummyUserAction> onUserAction;
  PlayerCardStack(
      {Key? key,
      required this.cards,
      required this.vertical,
      required this.onUserAction,
      this.mode = StackMode.SWAP_MODE,
      this.nextCard = -1})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _PlayerCardStackState createState() => _PlayerCardStackState();
}

class _PlayerCardStackState extends State<PlayerCardStack> {
  late List<int> _clickList = List.empty(growable: true);
  bool _showSwapButton = false;
  bool _showPopCard = true;
  bool _newCardTook = false;
  @override
  Widget build(BuildContext context) {
    return _getScreen();
  }

  Widget _getScreen() {
    List<Widget> wList = List.empty(growable: true);
    wList.add(createScrollableStack(widget.cards, vertical: widget.vertical));
    if (_showSwapButton) wList.add(_getControlButton());
    if (_showPopCard && widget.mode == StackMode.REPLACE_MODE)
      wList.add(_getPopCard(widget.nextCard));
    return Stack(children: wList);
  }

  Widget createScrollableStack(List<int> l, {bool vertical = true}) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      //alignment: Alignment.centerRight,
      child: Container(
        height: 650,
        child: ListView(
            //shrinkWrap: true,
            //padding: EdgeInsets.all(50.0),
            //shrinkWrap: true,
            //controller: sc,
            scrollDirection: vertical ? Axis.vertical : Axis.horizontal,
            children: [
              vertical ? _getVerticalContainer(l) : _getHorizontalContainer(l),
            ]),
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
          /*
          icon: Icon(Icons.swap_horiz),
          label: Text(
            widget.startTournament.round.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          */
          label: Icon(Icons.swap_horiz),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.black,
          heroTag: "swapped",
          onPressed: () {
            print("swapped");
          },
        ),
      ),
    );
  }

  Widget _getPopCard(int card) {
    List<Widget> wl = List.empty(growable: true);
    //the pop up card
    wl.add(PlayingCard(PACK[card]));
    //not a proper way but it works
    if (!_newCardTook) {
      wl.add(Positioned(
        right: 55,
        bottom: 170,
        child: FloatingActionButton.extended(
          onPressed: () {
            _newCardTook = true;
            setState(() {});
          },
          label: Icon(Icons.check),
          backgroundColor: Colors.green,
          heroTag: "onAccept",
        ),
      ));

      wl.add(Positioned(
          left: 10,
          bottom: 170,
          child: FloatingActionButton.extended(
            onPressed: () {
              _showPopCard = false;
              setState(() {});
            },
            label: Icon(Icons.close),
            backgroundColor: Colors.red,
            heroTag: "onDiscard",
          )));
    }
    return Positioned(
        top: 80,
        right: -50,
        child: Stack(
          children: wl,
        ));
  }

  Widget getAt(int card, int index) {
    return InkWell(
        onTap: () {
          print(card);
          print(index);
          if (widget.mode == StackMode.SWAP_MODE) {
            if (!_clickList.contains(index)) {
              _clickList.add(index);
            } else {
              _clickList.remove(index);
            }

            if (_clickList.length > 2) {
              _clickList.removeAt(0);
              print(_clickList);
            }
            _showSwapButton = (_clickList.length == 2);
          } else if (widget.mode == StackMode.REPLACE_MODE && _newCardTook) {
            if (!_clickList.contains(index))
              _clickList.add(index);
            else
              _clickList.remove(index);
            if (_clickList.length > 1) {
              _clickList.removeAt(0);
              print(_clickList);
            }
            _showSwapButton = (_clickList.length == 1);
          }

          setState(() {});
        },
        child: PlayingCard(PACK[card]));
  }

  Widget _getVerticalContainer(List<int> l) {
    return Container(
      height: l.length * 100.0 + 500,
      //width: l.length * 100.0 + 300,
      child: Stack(
        alignment: Alignment.center,
        children: cardsFromList(l, vertical: true),
      ),
    );
  }

  Widget _getHorizontalContainer(List<int> l) {
    return Container(
      //height: l.length * 100.0 + 600,
      //padding: const EdgeInsets.only(top: 32),
      width: l.length * 100.0 + 300,
      child: Stack(
        alignment: Alignment.center,
        children: cardsFromList(l, vertical: false),
      ),
    );
  }

  double _getCardTopPos(int index) {
    if (_clickList.contains(index)) return 80;
    return 100;
  }

  List<Widget> cardsFromList(List<int> l, {bool vertical = true}) {
    double start = 50;
    List<Widget> wl = List<Widget>.generate(l.length, (int index) {
      if (!vertical) {
        return Positioned(
          //top: (index * 100) + start,
          //top: 100,
          top: _getCardTopPos(index),
          left: (index * 100) + start,
          child: getAt(l[index], index),
        );
      } else {
        return Positioned(
          top: (index * 100) + start,
          //left: (index * 100) + start,
          child: getAt(l[index], index),
        );
      }
    });
    return wl;
  }
}
