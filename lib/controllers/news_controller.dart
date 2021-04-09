// import 'package:event_app/models/event_list.dart';
import 'package:event_app/models/new.dart';
// import 'package:event_app/models/products.dart';
import 'package:event_app/services/remote_services.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

class NewsController extends GetxController {
  var news = List<Mock>().obs;
  var isLoading = true.obs;
  var eventId;
  // var eventsList = eventList;

  @override
  void onInit() {
    super.onInit();
    //   CircularProgressIndicator();
    fetchNews();
    // GetStorage box = GetStorage();
    // if(box.read('pageId')!=null){
    //    eventId = box.read('pageId');
    // }
  }

  void fetchNews() async {
    isLoading(true);
    try {
      var newsResult = await RemoteServices.fetchNews();
      if (newsResult != null) {
        news.assignAll(newsResult);// events.assignAll(eventResult) as List<Welcome>;
        // print(newsResult);
      }
    } finally {
      isLoading(false);
    }
    
    //
  }
}
