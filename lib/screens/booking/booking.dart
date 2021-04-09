import 'package:event_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text(
                'Edit Profile',
                style: headingStyle,
              ),
              Text('Full Name'),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.2),
                  ),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Jane Doe',
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
              Text('Phone Number'),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.2),
                  ),
                  child: TextField(
                    controller: numberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: '080 XXX XXXX',
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
                onTap: () {
                  //       print("$nameController.text");
                  // print('$numberController.text');
                  // print('$emailController.text');
                  print('$Get.arguments.id');
                 // print(get.)
                  // if (//GetUtils.isPhoneNumber(numberController.text) ||
                  //     // GetUtils.isEmail(emailController.text) ||
                  //     // GetUtils.isUsername(nameController.text) 
                  //     GetUtils.isLengthLessOrEqual(nameController.text, 2) ||
                  //     GetUtils.isLengthEqualTo(numberController.text, 11)
                  //     ) {
                   
                  //       Get.snackbar('Bad Format', 'Check Details',
                  //       snackPosition: SnackPosition.BOTTOM,
                  //       colorText: Colors.red);
                  //       //  Get.snackbar('Correct Format', 'Booking Event',
                  //       // snackPosition: SnackPosition.BOTTOM,
                  //       // colorText: Colors.green);
                  

                  // } else {
                  //   Get.snackbar('Correct Format', 'Booking Event',
                  //       snackPosition: SnackPosition.BOTTOM,
                  //       colorText: Colors.green);
                    // Get.snackbar('Bad Format', 'Check Details',
                    //     snackPosition: SnackPosition.BOTTOM,
                    //     colorText: Colors.red);
                  //}

                  



                },
                child: NewWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
