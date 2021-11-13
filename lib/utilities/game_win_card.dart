import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rooster_cards/ads/ad_helper.dart';
import 'package:rooster_cards/cards/boxofcards.dart';

import 'package:rooster_cards/proto/tournament_data.pb.dart';

enum PlayerStat {
  WINNER,
  LOSER,
}

class GameWinCard extends StatefulWidget {
  final int time;
  final String player;
  final String round;
  final Color c;
  final IconData icon;
  final AfterWinCards afterWinCards;
  final Map points;
  final PlayerStat stat;
  final bool computerGame;

  GameWinCard({
    required this.stat,
    this.time = 0,
    this.player = "You",
    required this.round,
    this.c = Colors.green,
    this.icon = Icons.military_tech,
    required this.afterWinCards,
    required this.points,
    this.computerGame = false,
  });
  @override
  _GameWinCardState createState() => _GameWinCardState();
}

class _GameWinCardState extends State<GameWinCard> {
  InterstitialAd? _interstitialAd;

  bool _isInterstitialAdReady = false;

  @override
  void initState() {
    _loadInterstitialAd();
    super.initState();
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          this._interstitialAd = ad;

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              Navigator.pop(context);
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
    return Container(
        //top: 20,
        child: Stack(
      children: [
        _winBanner(),
        if (widget.computerGame) _closeButton(),
      ],
    ));
  }

  Widget _winBanner() {
    return Container(
        //top: 20,
        child: Align(
            alignment: Alignment.center,
            child: Container(
              //height: 2048,
              //decoration: _getDecoration(c: c),
              child: _getCard(),
            )));
  }

  Widget _closeButton() {
    return Container(
        padding: EdgeInsets.all(16.0),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton.extended(
                onPressed: () {
                  if (_isInterstitialAdReady) {
                    _interstitialAd?.show();
                  } else {
                    Navigator.pop(context);
                  }
                },
                label: Text("CLOSE"))));
  }

  Decoration _getDecoration({Color c = Colors.grey}) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage("images/win_background.png"),
        fit: BoxFit.cover,
      ),
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
      height: 512 + widget.afterWinCards.playerCards.length * 120,
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      decoration: _getDecoration(c: widget.c),
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
        widget.icon,
        size: 64,
      ),
      Text(
        widget.round,
        style: TextStyle(
          fontSize: 24,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
        ),
      ),
    ]);

    if (widget.stat == PlayerStat.WINNER) {
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
    } else if (widget.stat == PlayerStat.LOSER) {
      wl.addAll([
        Text(
          widget.player,
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
    /*
    var sortedMap =
        SplayTreeMap.from(widget.afterWinCards.playerCards, (k1, k2) {
      return widget.points[k1]!.compareTo(widget.points[k2] ?? 0);
    });
    */

    List<Widget> L = [];
    //Map.from(sortedMap).forEach((player, playerCard) {
    widget.points.forEach((player, pts) {
      //rprint("${widget.points[player]}Pts");
      //rprint("player");
      L.add(Column(
        children: [
          Text(player,
              style: TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              )),
          Text("$pts Pts",
              style: TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              )),
          Container(
              child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              child: _getCardStack(
                  widget.afterWinCards.playerCards[player]!.cards),
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
