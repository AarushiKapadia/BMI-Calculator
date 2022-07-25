import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton ({@required this.onTap, @required this.ButtonTitle});

  final Function onTap;
  final String ButtonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(ButtonTitle,
              style: kLargeButtonTextStyle),
        ),
        color: kBottomColor,
        padding: EdgeInsets.only(bottom:20.0),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),);
  }
}