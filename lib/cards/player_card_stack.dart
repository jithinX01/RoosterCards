import 'package:flutter/rendering.dart';
import 'package:rooster_cards/cards/boxofcards.dart';
import 'package:rooster_cards/cards/playing_card.dart';

import 'package:flutter/material.dart';
import 'package:rooster_cards/rummy/rummy_user_action.dart';

enum StackMode {
  SWAP_MODE,
  REPLACE_MODE,
  VIEW_MODE,
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
  late List<int> _cards;
  bool _showSwapButton = false;
  bool _showPopCard = true;
  bool _newCardTook = false;

  StackMode _stackMode = StackMode.SWAP_MODE;

  @override
  void initState() {
    super.initState();
    _stackMode = widget.mode;
    print("Inited");
    _cards = List.from(widget.cards);
  }

  @override
  Widget build(BuildContext context) {
    /*
    if (!_userReplace) {
      _stackMode = widget.mode;
    } else {
      _userReplace = false;
    }
    */
    _stackMode = widget.mode;
    return _getScreen();
  }

  Widget _getScreen() {
    List<Widget> wList = List.empty(growable: true);
    wList.add(createScrollableStack(_cards, vertical: widget.vertical));
    if (_showSwapButton) wList.add(_getControlButton());
    print("getScreen");
    print(_stackMode);
    if (_showPopCard && _stackMode == StackMode.REPLACE_MODE)
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
            if (_stackMode == StackMode.SWAP_MODE) {
              swap();
              setState(() {});
            } else if (_stackMode == StackMode.REPLACE_MODE) {
              replace();
            }
            print(_stackMode);
          },
        ),
      ),
    );
  }

  void replace() {
    int card = _cards[_clickList[0]];
    _cards[_clickList[0]] = widget.nextCard;
    var action = RummyUserAction(rUserAction: RUserAction.REPLACE);
    action.newCard = widget.nextCard;
    action.oldCard = card;
    action.playerCards = _cards;

    _showPopCard = false;
    _showSwapButton = false;
    _clickList.clear();
    setState(() {
      _stackMode = StackMode.SWAP_MODE;
    });
    _showPopCard = true;

    _newCardTook = false;

    widget.onUserAction(action);
    //setState(() {});
  }

  void swap() {
    int card = _cards[_clickList[0]];

    _cards[_clickList[0]] = _cards[_clickList[1]];
    _cards[_clickList[1]] = card;

    var action = RummyUserAction(rUserAction: RUserAction.NORMAL_SWAP);
    action.playerCards = _cards;
    _clickList.clear();
    _showSwapButton = false;
    widget.onUserAction(action);
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
              RummyUserAction rummyUserAction =
                  RummyUserAction(rUserAction: RUserAction.DISCARD);
              rummyUserAction.newCard = card;
              _showPopCard = true;
              widget.onUserAction(rummyUserAction);
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
          if (_stackMode == StackMode.SWAP_MODE) {
            if (!_clickList.contains(index)) {
              _clickList.add(index);
            } else {
              _clickList.remove(index);
            }

            if (_clickList.length > 2) {
              _clickList.removeAt(0);
            }
            _showSwapButton = (_clickList.length == 2);
            print(_clickList);
            setState(() {});
          } else if (_stackMode == StackMode.REPLACE_MODE && _newCardTook) {
            if (!_clickList.contains(index))
              _clickList.add(index);
            else
              _clickList.remove(index);
            if (_clickList.length > 1) {
              _clickList.removeAt(0);
            }
            _showSwapButton = (_clickList.length == 1);
            print(_clickList);
            setState(() {});
          }
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
