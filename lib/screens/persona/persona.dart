import 'package:admob_flutter/admob_flutter.dart';
import 'package:event_app/services/admob_services/admob_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';

class Persona extends StatefulWidget {
  @override
  _PersonaState createState() => _PersonaState();
}

class _PersonaState extends State<Persona> {

// final newsController = Get.put(NewsController());
  static const _adUnitID1 = "ca-app-pub-9263475534029463/3050836414";
  static const _adUnitID2 = "ca-app-pub-9263475534029463/9424673070";
  static const _adUnitID3 = "ca-app-pub-9263475534029463/6606938043";

  final ams = AdmobServices();

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  final _nativeAdController = NativeAdmobController();

  AdmobInterstitial interstitialAd;

  AdmobReward rewardAd;

  @override
  void initState() {
    super.initState();
    // newsController.fetchNews();
    // FirebaseAdMob.instance
    //     .initialize(appId: 'ca-app-pub-4882399086103929~04755269510');
    // _bannerAd = createBannerAd()..load();
    // _interstitialAd = createInterstitialAd()..load();
    Admob.initialize();

    interstitialAd = AdmobInterstitial(
      adUnitId: ams.getInterstitialAdUnitId(),
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) interstitialAd.load();
        handleEvent(event, args, 'Interstitial');
      },
    );

    interstitialAd.load();
    // rewardAd?.load();
  }

  void handleEvent(
      AdmobAdEvent event, Map<String, dynamic> args, String adType) {
    switch (event) {
      case AdmobAdEvent.loaded:
        showSnackBar('New Admob $adType Ad loaded!');
        break;
      case AdmobAdEvent.opened:
        showSnackBar('Admob $adType Ad opened!');
        break;
      case AdmobAdEvent.closed:
        showSnackBar('Admob $adType Ad closed!');
        break;
      case AdmobAdEvent.failedToLoad:
        showSnackBar('Admob $adType failed to load. :(');
        break;
      case AdmobAdEvent.rewarded:
        showDialog(
          context: scaffoldState.currentContext,
          builder: (BuildContext context) {
            return WillPopScope(
              child: AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Reward callback fired. Thanks Andrew!'),
                    Text('Type: ${args['type']}'),
                    Text('Amount: ${args['amount']}'),
                  ],
                ),
              ),
              onWillPop: () async {
                scaffoldState.currentState.hideCurrentSnackBar();
                return true;
              },
            );
          },
        );
        break;
      default:
    }
  }

  void showSnackBar(String content) {
    scaffoldState.currentState.showSnackBar(
      SnackBar(
        content: Text(content),
        duration: Duration(milliseconds: 1500),
      ),
    );
  }

  @override
  void dispose() {
    // _bannerAd?.dispose();
    // _interstitialAd?.dispose();

    rewardAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
          body: Container(
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              Container(
                height: 500,
                width: double.infinity,
                color: Colors.blueAccent,
                child: Center(
                  child: ListTile(
                    title: Text(
                      'The Rocket Event Software',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 48,
                      ),
                    ),
                    subtitle: Text(
                      'Get Event Listings Around you today',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('APPLICATION PERSONA',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                          margin: EdgeInsets.all(8),
                          height: 100,
                          color: Colors.grey,
                          child: NativeAdmob(
                            adUnitID: _adUnitID2,
                            controller: _nativeAdController,
                            type: NativeAdmobType.full,
                            loading: Center(
                              child: CircularProgressIndicator(),
                            ),
                            error: Text('Failed to Load'),
                          ),
                        ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 15.0, right: 15),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 15.0, right: 15),
                child: Text(
                  'Meet Geofrey  ',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                          margin: EdgeInsets.all(8),
                          height: 100,
                          color: Colors.grey,
                          child: NativeAdmob(
                            adUnitID: _adUnitID1,
                            controller: _nativeAdController,
                            type: NativeAdmobType.full,
                            loading: Center(
                              child: CircularProgressIndicator(),
                            ),
                            error: Text('Failed to Load'),
                          ),
                        ),
              Padding(
               padding: const EdgeInsets.only(bottom: 15, left: 15.0, right: 15),
                child: Text(
                  "Geofrey is a lawyer who likes to party and attend events during his spare time and holidays. He also has issues with attending events without having the tickets to these events (mostly). This is until Geofrey finds out about 'The Rocket Event Software'. ",
                  style: TextStyle(fontSize: 22, ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 15.0, right: 15),
                child: Divider(),
              ),
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.black87,
                child: Center(
                    child: Text('Copyright ?? The Rocket Event Software 2020',
                        style: TextStyle(color: Colors.white, fontSize: 15))),
              ),
              Container(
                          margin: EdgeInsets.all(8),
                          height: 100,
                          color: Colors.grey,
                          child: NativeAdmob(
                            adUnitID: _adUnitID3,
                            controller: _nativeAdController,
                            type: NativeAdmobType.full,
                            loading: Center(
                              child: CircularProgressIndicator(),
                            ),
                            error: Text('Failed to Load'),
                          ),
                        ),
            ])),
      ),
    );
  }
}
