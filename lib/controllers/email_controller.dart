// import 'package:event_app/models/event_list.dart';
import 'package:event_app/controllers/renderServices.dart';
import 'package:event_app/models/products.dart';
import 'package:event_app/screens/listing/listing.dart';
import 'package:event_app/services/remote_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'dart:convert';

import 'package:event_app/screens/booking/booking.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmailController extends GetxController {
  var events = List<Bye>().obs;
  var isLoading = true.obs;
  var eventId;
  // var eventsList = eventList;

  // @override
  // void onInit() {
  //   super.onInit();
  //   //   CircularProgressIndicator();
  //   fetchEvents();
  //   GetStorage box = GetStorage();
  //   if(box.read('pageId')!=null){
  //      eventId = box.read('pageId');
  //   }
  // }

  void fetchData() async {
    isLoading(true);
    try {
      var eventResult = await RenderServices.fetchData();
      if (eventResult != null) {
        events.assignAll(
            eventResult); // events.assignAll(eventResult) as List<Welcome>;
      }
    } finally {
      isLoading(false);
    }

    //
  }
}


class RenderServices {
    

  //final email = EmailXScreen.emailController;

   static var client = http.Client();

  static Future<List<Bye>> fetchData() async {
    var response = await client.get(
        'https://projects.deelesisuanu.com/elliot-events/bookEventData?email=victo@admin');

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return byeFromJson(jsonString);
    } else {
      return null;
    }
  }
}

class EmailXScreen extends StatelessWidget {
   final TextEditingController emailController = TextEditingController();
  final eventController = Get.put(EmailController());

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
            child: Column(
          children: [
            Text('Email Address'),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(0.2),
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: '@Jane.Doe17',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                child: NewWidget(),
                onTap: () async {
                  eventController.fetchData();
                  Get.to(
                    ListingPage(),
                  );
                })
          ],
        )),
      ),
    );
  }
}
