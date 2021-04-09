// To parse this JSON data, do
//
//     final mock = mockFromJson(jsonString);

import 'dart:convert';

List<Mock> mockFromJson(String str) => List<Mock>.from(json.decode(str).map((x) => Mock.fromJson(x)));

String mockToJson(List<Mock> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mock {
    Mock({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    int userId;
    int id;
    String title;
    String body;

    factory Mock.fromJson(Map<String, dynamic> json) => Mock(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
