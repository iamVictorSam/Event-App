import 'package:event_app/screens/goal/goals.dart';
import 'package:event_app/screens/home/home.dart';
import 'package:event_app/screens/manage_event/manage_event.dart';
import 'package:event_app/screens/persona/persona.dart';
import 'package:event_app/screens/sketches/sketches.dart';
import 'package:event_app/screens/technology/frameworks.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Home extends StatefulWidget {
  static String routeName = '/home_screen';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
//   PageController pageController = new PageController();
//   int currentIndex = 0;

//   void onTap(int page) {
//     setState(() {
//       currentIndex = page;
//     });
//     pageController.jumpToPage(page);
//   }

    int currentIndex = 0;
var _pages = [HomeScreen(), ManageEvent(), Goals(), Sketches(), Persona(), Frameworks()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          iconSize: 26,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          currentIndex: currentIndex,

          backgroundColor: nearlyWhite,
          unselectedItemColor: Colors.black54,
          // unselectedLabelStyle: TextStyle(color: Colors.black),
          selectedItemColor: kPrimraryColor,
          //selectedLabelStyle: TextStyle(color: Colors.yellow),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.border_all),
              label: 'Manage Events',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ballot_outlined),
              label: 'Goals',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_add),
              label: 'Sketches',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.keyboard_voice_outlined),
              label: 'Persona',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sanitizer_sharp),
              label: 'Frameworks',
            ),
          ],
      ),
    );
  }
}
