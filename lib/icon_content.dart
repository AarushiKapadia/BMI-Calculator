import 'package:flutter/material.dart';
import 'constants.dart';

class iconContents extends StatelessWidget {
  iconContents({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label,
          style: kLabelTextStyle,),
      ],
    );
  }
}