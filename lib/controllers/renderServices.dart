import 'package:event_app/models/products.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class RenderServices {
    


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