import 'package:flutter/material.dart';
import 'package:rooster_cards/cards/boxofcards.dart';
import 'package:rooster_cards/cards/playing_card.dart';

class Deck extends StatefulWidget {
  final int count;
  final bool shuffle;
  const Deck({Key? key, this.count = 52, this.shuffle = false})
      : super(key: key);
  @override
  _DeckState createState() => _DeckState();
}

class _DeckState extends State<Deck> {
  //int _i = 0;
  Dealer dealer = Dealer();
  PageController p = PageController(
    viewportFraction: 2.0,
  );
  int _page = 1;
  bool _loadDeck = true;

  @override
  void initState() {
    //rprint("Deck Made Init");
    dealer = Dealer(
      count: widget.count,
      shuffle: widget.shuffle,
    );
    //_val = _cards[dealer.give()].val;
    //_suit = _cards[dealer.give()].suit;
    p = PageController(
      viewportFraction: 2.0,
    );
    super.initState();
    _page = 1;
    //_pageChange = false;
  }

  List<Widget> _getCards() {
    List<int> l = dealer.cards;

    List<Widget> wl = List<Widget>.generate(l.length, (int index) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PlayingCard(PACK[l[index]]),
        ],
      );
    });
    return wl;
  }

  @override
  Widget build(BuildContext context) {
    if (_loadDeck) {
      dealer = Dealer(
        count: widget.count,
        shuffle: widget.shuffle,
      );
    } else {
      _loadDeck = true;
    }
    return Container(
      height: 520,
      //width: 300,
      //padding: EdgeInsets.all(50.0),
      //padding: EdgeInsets.only(left: 20,right: 20),
      alignment: Alignment.center,
      //width: 1000,

      child: Stack(
        children: <Widget>[
          PageView(
            controller: p,
            children: _getCards(),
            onPageChanged: (page) {
              setState(() {
                _loadDeck = false;
                _page = page + 1;
              });
            },
          ),
          Positioned(
            top: 20,
            right: 20,
            child: FloatingActionButton.extended(
              icon: Icon(Icons.credit_card),
              label: Text(
                "$_page",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              backgroundColor: Colors.green,
              foregroundColor: Colors.black,
              heroTag: "ggbb_22",
              onPressed: () {
                //rprint("pressed");
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Dealer {
  final int count;
  final bool shuffle;
  List<int> indexs = [];
  Dealer({this.count = 52, this.shuffle = false}) {
    var l = List<int>.generate(53, (int index) {
      return index;
    });
    if (shuffle) {
      l.shuffle();
    }
    indexs = l.sublist(0, count);
  }
  List<int> get cards {
    return indexs;
  }
}
