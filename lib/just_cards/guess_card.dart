import 'package:rooster_cards/just_cards/deck.dart';

class GuessCard {
  late Dealer _dealer;
  late int _found;
  final count;
  List<int> _deck = [];

  int _iteration = 0;
  GuessCard({this.count = 21}) {
    _dealer = Dealer(
      count: this.count,
      shuffle: true,
    );
    _deck.addAll(_dealer.cards);
  }
  List<int> get cards {
    return _deck;
  }

  //pos should be greater than 0
  //for deck1, deck2, deck3
  List<int> getDeck(int pos) {
    //rprint("Deck $pos");
    List<int> l = [];
    for (var i = (pos - 1); i < count; i = i + 3) {
      l.add(_deck[i]);
      //rprint(_deck[i]);
    }
    return l;
  }

  int getIteration() {
    return _iteration;
  }

  bool nextIter(int chosen) {
    _iteration++;

    if (_iteration == 3) {
      //rprint("found");
      List<int> ch = getDeck(chosen);
      //rprint(ch[ch.length ~/ 2]);
      _found = ch[ch.length ~/ 2];
      return true;
    }

    List<int> l = List.generate(3, (int index) => index + 1);
    l.remove(chosen);

    List<int> ch = getDeck(chosen);
    List<int> l1 = getDeck(l[0]);
    l1.shuffle();
    List<int> l3 = getDeck(l[1]);
    l3.shuffle();
    _deck.clear();
    _deck.addAll(l1.getRange(0, l1.length));
    _deck.addAll(ch.getRange(0, ch.length));
    _deck.addAll(l3.getRange(0, l3.length));
    return false;
  }

  int getFound() {
    return _found;
  }
}
