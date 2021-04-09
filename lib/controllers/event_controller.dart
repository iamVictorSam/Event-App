// import 'package:event_app/models/event_list.dart';
import 'package:event_app/models/products.dart';
import 'package:event_app/services/remote_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EventController extends GetxController {
  var events = List<Welcome>().obs;
  var isLoading = true.obs;
  var eventId;
  // var eventsList = eventList;

  @override
  void onInit() {
    super.onInit();
    //   CircularProgressIndicator();
    fetchEvents();
    // GetStorage box = GetStorage();
    // if(box.read('pageId')!=null){
    //    eventId = box.read('pageId');
    // }
  }

  void fetchEvents() async {
    isLoading(true);
    try {
      var eventResult = await RemoteServices.fetchData();
      if (eventResult != null) {
        events.assignAll(eventResult);// events.assignAll(eventResult) as List<Welcome>;
      }
    } finally {
      isLoading(false);
    }
    
    //
  }
}
