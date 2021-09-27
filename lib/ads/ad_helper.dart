import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      //return 'ca-app-pub-3940256099942544/6300978111';
      return 'ca-app-pub-6437340967876288/6175611368';
    }
    /* 
    else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    }
    */
    else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      //return "ca-app-pub-3940256099942544/1033173712";
      return 'ca-app-pub-6437340967876288/5933914697';
    }
    /* 
    else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/4411468910";
    }
    */
    else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
  /*
  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/5224354917";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1712485313";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
  */
}
