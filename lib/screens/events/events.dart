import 'dart:convert';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:event_app/controllers/event_controller.dart';
import 'package:event_app/screens/bottomnav/bottomnav.dart';
import 'package:event_app/screens/home/home.dart';
import 'package:event_app/services/admob_services/admob_services.dart';
// import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

// import 'package:image/image.dart' as ImageProcess;

class EventsScreen extends StatefulWidget {
  final eventController = Get.put(EventController());

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  // static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo();

  @override
  void initState() {
    super.initState();
    // RewardedVideoAd.instance.load(
    //   adUnitId: RewardedVideoAd.testAdUnitId,
    //   targetingInfo: targetingInfo,
    // );
    rewardAd = AdmobReward(
      adUnitId: ams.getRewardBasedVideoAdUnitIdEvent(),
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) rewardAd.load();
        handleEvent(event, args, 'Reward');
      },
    );
    rewardAd.load();
  }

  @override
  void dispose() {
    // interstitialAd.dispose();
    rewardAd.dispose();
    super.dispose();
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

  AdmobReward rewardAd;
  final ams = AdmobServices();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController numberController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  String userrId = Get.arguments.id;

  // Uint8List _bytesImage;

  String _imgString = Get.arguments.icon;
  String name = Get.arguments.name;
  String description = Get.arguments.description;
  String month = Get.arguments.month;
  String dayMonth = Get.arguments.dayMonth;
  String fullDate = Get.arguments.fullDate;

//  = Base64Decoder().convert(_imgString);

// Image.memory(_bytesImage)

// final _byteImage = Base64Decoder().convert(_imgString);
// Widget image = Image.memory(_byteImage);

  Dio dio = new Dio();
  Future postData() async {
    final String pathUrl =
        'https://projects.deelesisuanu.com/elliot-events/bookEvent';

    dynamic data = {
      'fullName': nameController.text,
      'emailAddress': emailController.text,
      'phoneNumber': numberController.text,
      'eventId': userrId,
    };

    var response = await dio.post(
      pathUrl,
      data: data,
    );
    if (response.statusCode == 200) {
      return response.data;
      // ignore: dead_code
      Get.snackbar('Success', response.statusMessage,
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.green);
    } else {
      Get.snackbar('Error', response.statusMessage,
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Uint8List bytes;
    //  if (_imgString == null)
    //   return new Container();
    // else
    //   bytes = base64Decode(_imgString);
    return Scaffold(
      //appBar: AppBar(backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: context.height,
              child: Stack(
                children: [
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0), ),
                      image: DecorationImage(
                        image: NetworkImage(_imgString),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    child: IconButton(
                      onPressed: () async {
                        Get.back();

                        if (await rewardAd.isLoaded) {
                          rewardAd.show();
                        } else {
                          showSnackBar('Reward ad is still loading...');
                        }
                      },
                      icon: Icon(Icons.arrow_back_ios_outlined),
                      color: Colors.white,
                      iconSize: 28,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: context.height * 0.50),
                    height: context.height,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 0.0, left: 25, right: 25),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          // Text(
                          //   userrId,
                          //   style: TextStyle(
                          //       color: Colors.black,
                          //       fontSize: 22,
                          //       fontWeight: FontWeight.bold),
                          // ),
                          Text(
                            name,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            fullDate,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Html(
                              data: description,
                              // style: TextStyle(
                              //   color: Colors.grey[600],
                              //   fontSize: 16,
                              // fontWeight: FontWeight.bold
                              // ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    'Book Now (Fill in details)',
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
                                child: Text(
                                  'Full Name',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey.withOpacity(0.2),
                                  ),
                                  child: TextField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      hintText: 'Jane Doe',
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      border: OutlineInputBorder(
                                          //gapPadding: ,
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.zero),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.zero),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.zero),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
                                child: Text(
                                  'Email Address',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey.withOpacity(0.2),
                                  ),
                                  child: TextField(
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      hintText: 'janedoe@email.com',
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      border: OutlineInputBorder(
                                          //gapPadding: ,
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.zero),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.zero),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.zero),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
                                child: Text(
                                  'Phone Number',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey.withOpacity(0.2),
                                  ),
                                  child: TextField(
                                    controller: numberController,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      hintText: '080 XXX XXXX',
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      border: OutlineInputBorder(
                                          //gapPadding: ,
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.zero),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.zero),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.zero),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  // RewardedVideoAd.instance.show();
                                  if (await rewardAd.isLoaded) {
                                    rewardAd.show();
                                  } else {
                                    showSnackBar(
                                        'Reward ad is still loading...');
                                  }
                                  Get.snackbar(
                                    '',
                                    'Posting',
                                    showProgressIndicator: true,
                                    snackPosition: SnackPosition.BOTTOM,
                                    duration: Duration(seconds: 1),
                                  );
                                  print(userrId);
                                  print('Posting data....');
                                  await postData().then((value) {
                                    print(value);
                                    final message = json.decode(value);
                                    // if()
                                    Get.snackbar('', message["text"],
                                        snackPosition: SnackPosition.BOTTOM);

                                    if (message["status"] ||
                                        message["status"] == "true") {
                                      Get.offAll(Home());
                                    }
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    height: 60,
                                    width: 150,
                                    child: Center(
                                      child: Text(
                                        'Submit',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // SizedBox(height: 660)
                            ],
                          )),

                          SizedBox(height: 80)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
