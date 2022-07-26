import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

ReusableCard({@required this.colour, this.cardChild, this.onPress});

final Color colour; //final makes this property immutable
final Widget cardChild;
final Function onPress;

@override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: onPress,
  child: Container(
    child: cardChild,
    margin: EdgeInsets.all(15.0),
    decoration: BoxDecoration(
      color: colour,
      borderRadius: BorderRadius.circular(12.0),
    ),
  ));
}
}

//color: Color(0xFF1D1E33)