import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rooster_cards/ads/ad_helper.dart';

class TournamentWinnersCard extends StatefulWidget {
  final String tournamentName;
  final bool sharedTrophy;
  final List<String> wonPlayers;
  final int trophyId;
  final Color c;
  final IconData icon;
  const TournamentWinnersCard({
    Key? key,
    this.trophyId = 1,
    this.tournamentName = "",
    this.c = Colors.green,
    this.icon = Icons.emoji_events,
    this.sharedTrophy = false,
    required this.wonPlayers,
  }) : super(key: key);

  @override
  _TournamentWinnersCardState createState() => _TournamentWinnersCardState();
}

class _TournamentWinnersCardState extends State<TournamentWinnersCard> {
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

  Widget _getCard(String tournamentName, Color c, IconData icon) {
    return Container(
      width: 300,
      height: 600,
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      decoration: _getDecoration(c: c),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _getWidgets(),
      ),
    );
  }

  String _getTrophy(int trophyId) {
    switch (trophyId) {
      case 1:
        return 'images/trophy.png';
      default:
        return 'images/trophy.png';
    }
  }

  List<Widget> _getWidgets() {
    List<Widget> wl = [
      /*
      Icon(
        icon,
        size: 96,
      ),
      */
      Image.asset(
        _getTrophy(widget.trophyId),
        scale: 1,
      ),
      Text(
        widget.tournamentName,
        style: TextStyle(
          fontSize: 16,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        widget.sharedTrophy ? "WINNERS" : "WINNER",
        style: TextStyle(
          fontSize: 32,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
        ),
      )
    ];
    widget.wonPlayers.forEach((player) {
      wl.add(Text(
        player,
        style: TextStyle(
          fontSize: 32,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
        ),
      ));
    });
    return wl;
  }

  @override
  Widget build(BuildContext context) {
    /*
    return Container(
        //top: 20,
        child: Align(
      alignment: Alignment.center,
      child: _getCard(widget.tournamentName, widget.c, widget.icon),
    ));
    */

    return Container(
        //top: 20,
        child: Stack(
      children: [
        _winBanner(),
        _closeButton(),
      ],
    ));
  }

  Widget _winBanner() {
    return Container(
        //top: 20,
        child: Align(
      alignment: Alignment.center,
      child: _getCard(widget.tournamentName, widget.c, widget.icon),
    ));
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
