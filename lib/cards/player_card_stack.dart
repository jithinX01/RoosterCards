import 'package:rooster_cards/cards/boxofcards.dart';
import 'package:rooster_cards/cards/playing_card.dart';

import 'package:flutter/material.dart';
import 'package:rooster_cards/rummy/rummy_user_action.dart';
import 'dart:math';

import 'package:rooster_cards/utilities/timer_message.dart';

enum StackMode {
  SWAP_MODE,
  MINIMISE_MODE,
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

class _PlayerCardStackState extends State<PlayerCardStack>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  late List<int> _clickList = List.empty(growable: true);
  //late List<int> _cards;
  bool _showSwapButton = false;
  bool _showPopCard = true;
  bool _newCardTook = false;
  bool _fromInside = false;
  bool _groupMode = false;
  String _toggleText = "S";
  int _inCards = 0;
  late Size biggest;
  StackMode _stackMode = StackMode.SWAP_MODE;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
    if (!_fromInside) {
      //rprint("Not From Inside");
      _stackMode = widget.mode;
    } else {
      _fromInside = false;
    }
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      biggest = constraints.biggest;

      return _getScreen();
    });
  }

  Widget _getScreen() {
    List<Widget> wList = List.empty(growable: true);
    if (!_newCardTook && _showPopCard && _stackMode == StackMode.REPLACE_MODE) {
      _clickList.clear();
    }
    wList.add(createScrollableStack(widget.cards, vertical: widget.vertical));

    //rprint("getScreen");
    //rprint(widget.cards);
    //rprint(_stackMode);
    if (_showPopCard && _stackMode == StackMode.REPLACE_MODE) {
      wList.add(_getPopCard(widget.nextCard));
    }
    if (_stackMode == StackMode.MINIMISE_MODE) {
      wList.add(_getMinimiseCard(widget.nextCard));
    }
    if (_showSwapButton) wList.add(_getControlButton());
    if (_stackMode == StackMode.SWAP_MODE ||
        _stackMode == StackMode.MINIMISE_MODE) {
      wList.add(_getSwapModeToggle());
    }
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
          icon: Icon((_groupMode &&
                  (_stackMode == StackMode.SWAP_MODE ||
                      _stackMode == StackMode.MINIMISE_MODE))
              ? Icons.sort
              : Icons.swap_horiz),
          label: Text((_groupMode &&
                  (_stackMode == StackMode.SWAP_MODE ||
                      _stackMode == StackMode.MINIMISE_MODE))
              ? "Group"
              : "Swap"),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.black,
          heroTag: "swapped",
          onPressed: () {
            if (_stackMode == StackMode.SWAP_MODE ||
                _stackMode == StackMode.MINIMISE_MODE) {
              _groupMode ? group() : swap();
              //setState(() {});
            } else if (_stackMode == StackMode.REPLACE_MODE) {
              replace();
            }
            //rprint(_stackMode);
          },
        ),
      ),
    );
  }

  Widget _getSwapModeToggle() {
    return Positioned.fill(
      top: 20,
      right: 40,
      child: Align(
        alignment: Alignment.topRight,
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
          icon: Icon(_groupMode ? Icons.sort : Icons.swap_horiz),
          label: Text(_toggleText),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.black,
          heroTag: "togglemode",
          onPressed: () {
            _groupMode = !_groupMode;
            _toggleText = _groupMode ? "G" : "S";
            _snackBar();
            setState(() {});
          },
        ),
      ),
    );
  }

  void replace() {
    //List<int> cards = List.from(widget.cards);
    int card = widget.cards[_clickList[0]];
    widget.cards[_clickList[0]] = widget.nextCard;
    var action = RummyUserAction(rUserAction: RUserAction.REPLACE);
    action.newCard = widget.nextCard;
    action.oldCard = card;
    action.playerCards.addAll(widget.cards);

    _showPopCard = false;
    _showSwapButton = false;
    _clickList.clear();
    _fromInside = true;
    _stackMode = StackMode.SWAP_MODE;
    setState(() {});

    _showPopCard = true;
    _newCardTook = false;

    widget.onUserAction(action);
    //setState(() {});
  }

  void swap() {
    int card = widget.cards[_clickList[0]];

    widget.cards[_clickList[0]] = widget.cards[_clickList[1]];
    widget.cards[_clickList[1]] = card;

    var action = RummyUserAction(rUserAction: RUserAction.NORMAL_SWAP);
    action.playerCards.addAll(widget.cards);
    _clickList.clear();
    _showSwapButton = false;
    setState(() {});
    widget.onUserAction(action);
  }

  void group() {
    List<int> cards = [];
    //get clicked cards
    _clickList.forEach((index) {
      cards.add(widget.cards[index]);
    });
    //sort group
    cards.sort();
    //remove cards from list
    cards.forEach((card) {
      widget.cards.remove(card);
    });
    //add cards to begining of list
    widget.cards.insertAll(0, cards);

    var action = RummyUserAction(rUserAction: RUserAction.NORMAL_SWAP);
    action.playerCards.addAll(widget.cards);
    _clickList.clear();
    _showSwapButton = false;
    setState(() {});
    widget.onUserAction(action);
  }

  Widget _getPopCard(int card) {
    List<Widget> wl = List.empty(growable: true);
    //the pop up card
    wl.add(
      _newCardTook
          ? PlayingCard(PACK[card])
          : GestureDetector(
              child: PlayingCard(PACK[card]),
              onDoubleTap: () {
                var action = RummyUserAction(rUserAction: RUserAction.MINIMISE);
                widget.onUserAction(action);
              },
            ),
    );

    //not a proper way but it works
    if (!_newCardTook) {
      ++_inCards;
      if (_inCards < 4) {
        wl.add(Positioned(
          child: TimerMessage(time: 2, message: "Double Tap to minimize card"),
          top: 0,
        ));
      }
      _clickList.clear();
      _showSwapButton = false;
      wl.add(Positioned(
        right: 55,
        //bottom: 170,
        top: 55,
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
          left: 35,
          //bottom: 170,
          top: 55,
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
    return Positioned.fill(
      top: 80,
      right: -50,
      //alignment: Alignment.center,
      child: DraggableScrollableSheet(
          builder: (BuildContext context, ScrollController scrollController) {
        return Align(
          //alignment: Alignment.bottomRight,
          //scrollDirection: Axis.horizontal,
          //controller: scrollController,
          child: Container(
            //height: 600,
            //width: 400,
            child: SingleChildScrollView(
              //clipBehavior: Clip.antiAliasWithSaveLayer,
              scrollDirection: Axis.vertical,
              controller: scrollController,
              child: Container(
                width: _newCardTook ? 320 : 600,
                height: 520,
                child: Stack(
                  alignment: Alignment.center,
                  children: wl,
                ),
              ),
            ),
            /*
          child: Stack(
            alignment: Alignment.center,
            children: wl,
          ),
          */
          ),
        );
      }),
    );
    /*
        child: Stack(
          children: wl,
        ));
        */
  }

  Widget getAt(int card, int index) {
    return InkWell(
        onTap: () {
          //rprint(card);
          //rprint(index);
          if (_stackMode == StackMode.SWAP_MODE ||
              _stackMode == StackMode.MINIMISE_MODE) {
            if (!_clickList.contains(index)) {
              _clickList.add(index);
            } else {
              _clickList.remove(index);
            }
            if (!_groupMode) {
              if (_clickList.length > 2) {
                _clickList.removeAt(0);
              }

              _showSwapButton = (_clickList.length == 2);
            } else {
              _showSwapButton = _clickList.length > 1;
              if (_clickList.length > 4) {
                _clickList.removeAt(0);
              }
            }
            //rprint(_clickList);
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
            //rprint(_clickList);
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
      width: l.length * 100.0 + 350,
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
      //print((pi / ((index - 6).abs() + 2)) * (index > 6 ? 1 : -1));

      //var angle = (pi / ((index - 6).abs() + 2)) * (index > 6 ? 1 : -1);
      var angle = 2 * pi;
      if (!vertical) {
        return Positioned(
          //top: (index * 100) + start,
          //top: 100,

          top: _getCardTopPos(index),
          left: (index * 100) + start,
          child: Transform.rotate(angle: angle, child: getAt(l[index], index)),
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

  void _snackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_groupMode ? "Group Mode" : "Swap Mode"),
        duration: const Duration(seconds: 1),
        width: 100.0,
        // Width of the SnackBar.
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0, // Inner padding for SnackBar content.
        ),

        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget _getMinimiseCard(int card) {
    const double smallLogo = 200;
    const double bigLogo = 200;

    return PositionedTransition(
        //return AnimatedPositioned(
        rect: RelativeRectTween(
          begin: RelativeRect.fromSize(
              Rect.fromLTWH(
                  (biggest.width - bigLogo) / 2, 185, smallLogo, smallLogo),
              biggest),
          /*
          end: RelativeRect.fromSize(
              Rect.fromLTWH(biggest.width - bigLogo, biggest.height - bigLogo,
                  bigLogo, bigLogo),
              biggest),
          */
          end: RelativeRect.fromSize(
              Rect.fromLTWH(
                  (biggest.width - bigLogo) / 2, 200, bigLogo, bigLogo),
              biggest),
        ).animate(CurvedAnimation(
          parent: _controller,
          curve: Curves.elasticInOut,
        )),
        //bottom: 5,
        //right: 5,
        //duration: Duration(seconds: 2),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Stack(children: [
            GestureDetector(
              onTap: () {
                var action = RummyUserAction(rUserAction: RUserAction.MAXIMISE);
                widget.onUserAction(action);
              },
              child: getTinyPlayCard(PACK[card]),
            ),
            //TimerButton(onEnd: () {}, time: 20),
          ]),
        ));
  }
}
