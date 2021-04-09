import 'dart:async';
import 'dart:ffi';

import 'package:event_app/constants.dart';
import 'package:event_app/controllers/event_controller.dart';
import 'package:event_app/screens/events/events.dart';
import 'package:event_app/services/admob_services/admob_services.dart';
// import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:get/get.dart';
import 'package:admob_flutter/admob_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final eventController = Get.put(EventController());
  final ams = AdmobServices();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  // static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo();
  final _nativeAdController = NativeAdmobController();
  static const _adUnitID = "ca-app-pub-9263475534029463/1438371841";
  // static const appId = 'ca-app-pub-4882399086103929~4755269510';
  AdmobInterstitial interstitialAd;
  AdmobReward rewardAd;
  // InterstitialAd _interstitialAd;

  // InterstitialAd createInterstitialAd() {
  //   return InterstitialAd(
  //       targetingInfo: targetingInfo,
  //       adUnitId: BannerAd.testAdUnitId,
  //       listener: (MobileAdEvent event) {
  //         print('Banner Event: $event');
  //       });
  // }

  // BannerAd _bannerAd;

  // BannerAd createBannerAd() {
  //   return BannerAd(
  //       targetingInfo: targetingInfo,
  //       adUnitId: BannerAd.testAdUnitId,
  //       size: AdSize.smartBanner,
  //       listener: (MobileAdEvent event) {
  //         print('Banner Event: $event');
  //       });
  // }

  @override
  void initState() {
    super.initState();
    eventController.fetchEvents();
    // FirebaseAdMob.instance
    //     .initialize(appId: 'ca-app-pub-4882399086103929~4755269510');
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
    // Timer(Duration(seconds: 4), () {
    //   _bannerAd?.show();
    // });
    return Scaffold(
        appBar: AppBar(title: Text('Rocket Events Software')),
        
        body: Container(
          child: Obx(() {
            if (eventController.isLoading.value)
              return Center(child: CircularProgressIndicator());
            else
              return ListView.separated(
                itemCount: eventController.events.length,
            itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                    child: GestureDetector(
                      onTap: () async {
                        if (await interstitialAd.isLoaded) {
                          interstitialAd.show();
                        } else {
                          showSnackBar('Interstitial ad is still loading...');
                        }

                        // _bannerAd?.dispose();
                        // _bannerAd = null;
                        // _interstitialAd?.show();
                        Get.to(EventsScreen(),
                            arguments: eventController.events[index]);
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                              height: 280,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                // borderRadius: BorderRadius.circular(7),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        eventController.events[index].icon),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            ListTile(
                              leading: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Column(
                                  children: [
                                    Center(
                                        child: Text(
                                      '${eventController.events[index].month}',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    Center(
                                        child: Text(
                                      '${eventController.events[index].dayMonth}',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                              ),
                              title: Text(
                                '${eventController.events[index].name}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                              subtitle: Text(
                                  '${eventController.events[index].fullDate}'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return index % 2 == 0
                      ? Container(
                          margin: EdgeInsets.all(8),
                          height: 200,
                          color: Colors.grey,
                          child: NativeAdmob(
                            adUnitID: _adUnitID,
                            controller: _nativeAdController,
                            type: NativeAdmobType.full,
                            loading: Center(
                              child: CircularProgressIndicator(),
                            ),
                            error: Text('Failed to Load'),
                          ),
                        )
                      : Container();
                },
              );
          }),
        ));
  }
}
