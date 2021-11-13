import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rooster_cards/ads/ad_helper.dart';

class EliminationCard extends StatefulWidget {
  final String tournamentName;
  final String round;
  final Color c;
  final IconData icon;
  final Map points;

  const EliminationCard({
    Key? key,
    this.tournamentName = "",
    this.c = Colors.green,
    this.icon = Icons.outbond,
    required this.round,
    required this.points,
  }) : super(key: key);

  @override
  _EliminationCardState createState() => _EliminationCardState();
}

class _EliminationCardState extends State<EliminationCard> {
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

  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          _winBanner(),
          _closeButton(),
        ],
      ),
    );
  }

  Widget _winBanner() {
    return Container(
        //top: 20,
        child: Align(
      alignment: Alignment.center,
      child: _getCard(),
    ));
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
      height: 512 + widget.points.length * 60,
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
      Text(
        "Your are Eliminated!",
        style: TextStyle(
          fontSize: 24,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
        ),
      ),
    ]);
    wl.add(_getPtsList());
    return wl;
  }

  Widget _getPtsList() {
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
      L.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(player,
              style: TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              )),
          Text("  $pts Pts",
              style: TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
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
}
