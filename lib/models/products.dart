// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
    Welcome({
        this.id,
        this.name,
        this.dateTime,
        this.description,
        this.icon,
        this.day,
        this.dayMonth,
        this.month,
        this.fullDate,
    });

    String id;
    String name;
    String dateTime;
    String description;
    String icon;
    String day;
    String dayMonth;
    String month;
    String fullDate;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        name: json["name"],
        dateTime: json["dateTime"],
        description: json["description"],
        icon: json["icon"],
        day: json["day"],
        dayMonth: json["dayMonth"],
        month: json["month"],
        fullDate: json["fullDate"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "dateTime": dateTime,
        "description": description,
        "icon": icon,
        "day": day,
        "dayMonth": dayMonth,
        "month": month,
        "fullDate": fullDate,
    };
}


// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);



// To parse this JSON data, do
//
//     final bye = byeFromJson(jsonString);



List<Bye> byeFromJson(String str) => List<Bye>.from(json.decode(str).map((x) => Bye.fromJson(x)));

String byeToJson(List<Bye> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Bye {
    Bye({
        this.id,
        this.fname,
        this.email,
        this.phone,
        this.eventName,
        this.eventId,
        this.created,
        this.bookingCode,
    });

    String id;
    String fname;
    String email;
    String phone;
    String eventName;
    String eventId;
    DateTime created;
    String bookingCode;

    factory Bye.fromJson(Map<String, dynamic> json) => Bye(
        id: json["id"],
        fname: json["fname"],
        email: json["email"],
        phone: json["phone"],
        eventName: json["eventName"],
        eventId: json["eventId"],
        created: DateTime.parse(json["created"]),
        bookingCode: json["bookingCode"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fname": fname,
        "email": email,
        "phone": phone,
        "eventName": eventName,
        "eventId": eventId,
        "created": created.toIso8601String(),
        "bookingCode": bookingCode,
    };
}
