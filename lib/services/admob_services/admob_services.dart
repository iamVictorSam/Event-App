import 'dart:io';

class AdmobServices {
//   String getBannerAdUnitId() {
//   if (Platform.isIOS) {
//     return 'ca-app-pub-3940256099942544/2934735716';
//   } else if (Platform.isAndroid) {
//     return 'ca-app-pub-3940256099942544/6300978111';
//   }
//   return null;
// }

  String getInterstitialAdUnitId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/4411468910';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-9263475534029463/3962122089';
    }
    return null;
  }


    String getInterstitialAdUnitIdMag() {
    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/4411468910';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-9263475534029463/4536837156';
    }
    return null;
  }

  String getRewardBasedVideoAdUnitId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/1712485313';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-9263475534029463/1657175336';
    }
    return null;
  }
  String getRewardBasedVideoAdUnitIdEvent() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544/1712485313';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-9263475534029463/8639733696';
  }
  return null;
}
}
