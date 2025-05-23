import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rooster_cards/ads/ad_helper.dart';
import 'package:rooster_cards/cards/boxofcards.dart';
import 'package:rooster_cards/cards/playing_card.dart';
import 'package:rooster_cards/just_cards/guess_card.dart';

enum GuessState {
  INIT,
  PROGRESS,
  FOUND,
}

enum Answers { YES, NO }
const String instructions =
    "1.Select the deck in which your card present\n2.Swipe right or left to switch between decks\n3.Scroll up or down to see all cards in a deck";

class GuessCardPage extends StatefulWidget {
  GuessCardPage();
  @override
  _GuessCardPageState createState() => _GuessCardPageState();
}

class _GuessCardPageState extends State<GuessCardPage> {
  GuessState _guessState = GuessState.INIT;
  GuessCard _gc = GuessCard();
  PageController _pc = PageController();
  int _deck = 1;
  Color _c = Colors.orange;
  int _card = 52;

  InterstitialAd? _interstitialAd;
  bool _isInterstitialAdReady = false;

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          this._interstitialAd = ad;

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              setState(() {
                _gc = GuessCard();
                _guessState = GuessState.INIT;
              });
            },
          );

          _isInterstitialAdReady = true;
        },
        onAdFailedToLoad: (err) {
          //rprint('Failed to load an interstitial ad: ${err.message}');
          _isInterstitialAdReady = false;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getScreen(),
    );
  }

  Widget _getScreen() {
    switch (_guessState) {
      case GuessState.INIT:
        _loadInterstitialAd();
        return _getInitGuessCard();
      case GuessState.PROGRESS:
        return _getGuessGame();
      case GuessState.FOUND:
        return _showCard();
      default:
        return _getInitGuessCard();
    }
  }

  Widget _getInitGuessCard() {
    return Stack(
      children: <Widget>[
        PageView(
          children: <Widget>[
            _verticalSrollableStack(_gc.cards),
          ],
        ),
        Positioned(
          bottom: 50,
          right: 20,
          child: FloatingActionButton.extended(
            icon: Icon(Icons.casino),
            label: Text("Let's Start!"),
            heroTag: "_gstart",
            onPressed: () {
              setState(() {
                _guessState = GuessState.PROGRESS;
              });
            },
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          left: 20,
          child: FloatingActionButton.extended(
            icon: Icon(Icons.memory),
            heroTag: "_gbaner",
            label: Text("Remeber A Card From Deck"),
            onPressed: () {
              //rprint("pressed");
            },
          ),
        ),
      ],
    );
  }

  Widget _getGuessGame() {
    return Stack(children: [
      PageView(
        controller: _pc,
        onPageChanged: (page) {
          //rprint("page $page");
          setState(() {
            _deck = page + 1;
            _c = _getColor(_deck);
          });
        },
        children: [
          _verticalSrollableStack(_gc.getDeck(1)),
          _verticalSrollableStack(_gc.getDeck(2)),
          _verticalSrollableStack(_gc.getDeck(3)),
        ],
      ),
      Positioned(
        bottom: 50,
        right: 20,
        child: FloatingActionButton.extended(
          icon: Icon(Icons.casino),
          label: Text(
            "Deck $_deck",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          backgroundColor: _c,
          foregroundColor: Colors.black,
          heroTag: "_ggdeck_",
          onPressed: () {
            //rprint("pressed");
            //rprint("${_pc.page}");
            _askUser(context);
          },
        ),
      ),
      Positioned(
        top: 50,
        right: 20,
        child: FloatingActionButton.extended(
          icon: Icon(Icons.help),
          label: Text("Help  "),
          heroTag: "_gghelp_",
          onPressed: () {
            //rprint("pressed");
            //rprint("${_pc.page}");
            _nextPopUp(context, instructions);
          },
        ),
      ),
    ]);
  }

  Widget _showCard() {
    return Stack(
      children: <Widget>[
        PageView(
          children: <Widget>[
            _verticalSrollableStack([_card]),
          ],
        ),
        Positioned(
          bottom: 50,
          right: 50,
          left: 50,
          child: FloatingActionButton.extended(
            icon: Icon(Icons.close),
            label: Text("Close"),
            heroTag: "_close_gc",
            onPressed: () {
              /*
              setState(() {
                _gc = GuessCard();
                _guessState = GuessState.INIT;
              });
              */

              if (_isInterstitialAdReady) {
                _interstitialAd?.show();
              } else {
                Navigator.pop(context);
                /*
                setState(() {
                  _gc = GuessCard();
                  _guessState = GuessState.INIT;
                });
                */
              }
            },
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          left: 20,
          child: FloatingActionButton.extended(
            icon: Icon(Icons.card_giftcard),
            heroTag: "_card_",
            label: Text("Your Card !"),
            onPressed: () {
              //rprint("pressed");
            },
          ),
        ),
      ],
    );
  }

  Widget _verticalSrollableStack(List<int> l) {
    return Container(
      alignment: Alignment.centerRight,
      child: ListView(
        //padding: EdgeInsets.all(50.0),
        //shrinkWrap: true,
        //controller: sc,
        children: [
          Container(
            height: l.length * 100.0 + 600,
            child: Stack(
              alignment: Alignment.center,
              children: _cardsFromList(l),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _cardsFromList(List<int> l) {
    double start = 50;

    List<Widget> wl = List<Widget>.generate(l.length, (int index) {
      return Positioned(
        top: (index * 100) + start,
        child: PlayingCard(PACK[l[index]]),
      );
    });
    return wl;
  }

  Color _getColor(int deck) {
    if (deck == 1)
      return Colors.orange;
    else if (deck == 2)
      return Colors.red;
    else if (deck == 3) return Colors.green;
    return Colors.orange;
  }

  void _nextRound(BuildContext c) {
    bool found = _gc.nextIter(_deck);
    if (!found) {
      String val = "";
      if (_gc.getIteration() == 1) {
        val = "One more Time!";
      } else if (_gc.getIteration() == 2) {
        val = "Last Round !";
      }
      _nextPopUp(c, val);
      setState(() {
        _pc.animateToPage(
          0,
          duration: Duration(
            microseconds: 250,
          ),
          curve: ElasticInCurve(),
        );
      });
    } else {
      _card = _gc.getFound();
      //rprint(_card);
      setState(() {
        _guessState = GuessState.FOUND;
      });
    }
  }

  Future _nextPopUp(BuildContext c, String val) async {
    await showDialog<bool>(
        context: c,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(
              val,
              textAlign: TextAlign.center,
            ),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text(
                  'OK',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          );
        });
  }

  Future _askUser(BuildContext c) async {
    switch (await showDialog<Answers>(
        context: c,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text(
              'Are you sure ?',
              textAlign: TextAlign.center,
            ),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Answers.YES);
                },
                child: const Text(
                  'Yes!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Answers.NO);
                },
                child: const Text(
                  'No,Select again!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          );
        })) {
      case Answers.YES:
        {
          //rprint("Yes");
          _nextRound(c);
          break;
        }
      case Answers.NO:
        {
          //rprint("No");
          break;
        }
      default:
    }
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }
}
