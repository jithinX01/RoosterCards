import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:rooster_cards/ads/ad_helper.dart';
import 'package:rooster_cards/just_cards/deck.dart';

class CardPicker extends StatefulWidget {
  CardPicker();
  @override
  _CardPickerState createState() => _CardPickerState();
}

class _CardPickerState extends State<CardPicker> {
  String _s = "Sorted";
  Icon _i = Icon(Icons.sort);
  bool _shuffled = false;
  int _count = 5;

  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    _initAds();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(24.0),
              ),
              SizedBox(
                child: Deck(
                  count: _count,
                  shuffle: _shuffled,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    cardOrder(),
                    cardCount(),
                  ],
                ),
              ),
              if (_isBannerAdReady)
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: _bannerAd.size.width.toDouble(),
                    height: _bannerAd.size.height.toDouble(),
                    child: AdWidget(ad: _bannerAd),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardOrder() {
    return FloatingActionButton.extended(
      onPressed: () {
        _shuffled = !_shuffled;
        if (_shuffled) {
          _s = "Shuffled";
          _i = Icon(Icons.shuffle);
        } else {
          _s = "Sorted";
          _i = Icon(Icons.sort);
        }
        setState(() {});
      },
      label: Text(_s),
      icon: _i,
    );
  }

  Widget cardCount() {
    return Container(
      child: NumberPicker(
          minValue: 5,
          maxValue: 53,
          itemCount: 1,
          value: _count,
          onChanged: (val) {
            setState(() {
              _count = val;
            });
          }),
    );
  }

  void _initAds() {
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          //rprint('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
  }
}
