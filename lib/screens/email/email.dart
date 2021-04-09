// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:event_app/screens/booking/booking.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:event_app/models/products.dart';
// import 'package:http/http.dart' as http;

// class EmailScreen extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();

//   void renderService() {
//     var client = http.Client();

//     Future<List<Welcome>> fetchData() async {
//       var response = await client.get(
//           'https://projects.deelesisuanu.com/elliot-events/bookEventData?email=${emailController.text}');
//       if (response.statusCode == 200) {
//         var jsonString = response.body;
//         return welcomeFromJson(jsonString);
//       } else {
//         return null;
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Container(
//             child: Column(
//           children: [
//             Text('Email Address'),
//             Padding(
//               padding: const EdgeInsets.only(left: 10.0, right: 10),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.blueGrey.withOpacity(0.2),
//                 ),
//                 child: TextField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     hintText: '@Jane.Doe17',
//                     contentPadding:
//                         EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                     border: OutlineInputBorder(
//                         //gapPadding: ,
//                         borderSide: BorderSide.none,
//                         borderRadius: BorderRadius.zero),
//                     enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide.none,
//                         borderRadius: BorderRadius.zero),
//                     focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide.none,
//                         borderRadius: BorderRadius.zero),
//                   ),
//                 ),
//               ),
//             ),
//             GestureDetector(
//                 child: NewWidget(),
//                 onTap: () async {
//                   Get.snackbar(
//                     '',
//                     'Posting',
//                     showProgressIndicator: true,
//                     snackPosition: SnackPosition.BOTTOM,
//                     duration: Duration(seconds: 1),
//                   );

//                   print('Posting data....');
//                   await fetchData().then((value) {
//                     print(value);
//                     final message = json.decode(value);
//                     // if()
//                     Get.snackbar('', message["text"],
//                         snackPosition: SnackPosition.BOTTOM);
//                   });
//                 })
//           ],
//         )),
//       ),
//     );
//   }
// }
