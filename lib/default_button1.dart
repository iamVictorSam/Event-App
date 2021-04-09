import 'package:flutter/material.dart';

import './constants.dart';
import './size_config.dart';

class DefaultButton1 extends StatelessWidget {
  const DefaultButton1({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);

  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        color: kPrimraryColor,
        textColor: Colors.white,
      ),
    );
  }
}
