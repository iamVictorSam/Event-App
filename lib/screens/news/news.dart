import 'package:admob_flutter/admob_flutter.dart';
import 'package:event_app/controllers/news_controller.dart';
import 'package:event_app/services/admob_services/admob_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:get/get.dart';

class NewsScreen extends StatefulWidget {
  static const _adUnitID = "ca-app-pub-9263475534029463/8720582600";

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final newsController = Get.put(NewsController());

  final ams = AdmobServices();

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  final _nativeAdController = NativeAdmobController();

  AdmobInterstitial interstitialAd;

  AdmobReward rewardAd;

  @override
  void initState() {
    super.initState();
    newsController.fetchNews();
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
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Obx(() {
          if (newsController.isLoading.value)
            return Center(child: CircularProgressIndicator());
          else
            return ListView.separated(
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
                        // // _interstitialAd?.show();
                        // Get.to(
                        //   EventsScreen(),
                        //   arguments:
                        //       '${newsController.news[index].articles[index]}',
                        // );
                      },
                      child: Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text('${newsController.news[index].id}'),
                            backgroundColor: Colors.green,
                          ),
                          title: Text(
                            '${newsController.news[index].title}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                          subtitle: Text(
                            '${newsController.news[index].body}',
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                    // return if(index = 2){
                    //   ContainerI();
                    // }

                  return index % 2 == 0
                      ? Container(
                          margin: EdgeInsets.all(8),
                          height: 200,
                          color: Colors.grey,
                          child: NativeAdmob(
                            adUnitID: NewsScreen._adUnitID,
                            controller: _nativeAdController,
                            type: NativeAdmobType.full,
                            loading: Center(
                              child: CircularProgressIndicator(),
                            ),
                            error: Text('Failed to Load'),
                          ),
                        )
                      : Container(color: Colors.blue,);
                },
                itemCount: newsController.news.length);
        }),
      ),
    );
  }
}
