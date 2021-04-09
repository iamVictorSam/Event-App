import 'package:event_app/constants.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    //scaffoldBackgroundColor: Colors.black,
    fontFamily: 'Muli',
    textTheme: textTheme(),
    appBarTheme: appBarTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    // bottomNavigationBarTheme: bottomNavigationBarThemeData(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    // applyElevationOverlayColor: true,
    shadowColor: Colors.black,
    timePickerTheme: TimePickerThemeData(
      backgroundColor: Colors.black,
      hourMinuteTextColor: Colors.white,
      hourMinuteColor: Colors.white,
    ),
  );
}

BottomNavigationBarThemeData bottomNavigationBarThemeData() {
  var selectedIconThemeData = IconThemeData(color: kPrimraryColor, size: 24);
  var unselectedIconThemeData = IconThemeData(color: Colors.black45, size: 24);
  return BottomNavigationBarThemeData(
    selectedIconTheme: selectedIconThemeData,
    unselectedIconTheme: unselectedIconThemeData,
    unselectedLabelStyle: TextStyle(color: Colors.black54),
    selectedLabelStyle: TextStyle(color: kPrimraryColor),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black54),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Color(0xFF8B8B8B),
        fontSize: 18,
      ),
    ),
    centerTitle: true,
  );
}
