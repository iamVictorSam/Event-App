import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:event_app/screens/bottomnav/bottomnav.dart';
import 'package:event_app/screens/home/home.dart';
import 'package:flutter/material.dart';

class InitScreen extends StatefulWidget {
  static String routeName = '/initScreen';
  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: SizedBox (
          child: Column(
            children: [
              Expanded(
                // flex: 2,
                          child: Image.asset('assets/i_am_rich_app_icon.png',
                    width: 350, height: 450),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 250.0),
                child: CircularProgressIndicator(),
              )
            ],
          ),
        ),
        splashIconSize: 380.0,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.black,
        duration: 3000,
        nextScreen: Home());
  }
}
