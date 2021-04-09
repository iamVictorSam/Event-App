import 'package:event_app/controllers/email_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ListingPage extends StatelessWidget {




    final eventController = Get.put(EmailController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(

      ),
      body: Container(
        child:Obx(() {
          if(eventController.isLoading.value)
            return Center(child: CircularProgressIndicator());
          else
          return ListView.builder(
          itemCount: eventController.events.length,
          itemBuilder: (BuildContext context, int index) {  
            return Card(child: ListTile(isThreeLine: true, subtitle: Text('${eventController.events[index].email}'), leading: Text('${eventController.events[index].fname}'), title: Text('${eventController.events[index].eventName}'), trailing: Text('${eventController.events[index].created}'), ));
          },
        );
        
        }),),
    );
  }
}