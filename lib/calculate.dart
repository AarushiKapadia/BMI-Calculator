import 'package:flutter/material.dart';
import 'dart:math';

class Calculator{

  Calculator({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI(){
    _bmi=weight / pow(height/100,2);
    return _bmi.toStringAsFixed(2);
  }

  String getResult(){

    if (_bmi>=25){
      return'OVERWEIGHT';
    }
    else if (_bmi>18.5){
      return 'NORMAL';
    }
    else{return 'UNDERWEIGHT';}
  }

  String getInterpretation(){

    if (_bmi>=25){
      return 'You are considered Overweight. \nIf you are physically inactive, you are at risk of developing cardiovascular disease amongst some more. \nGet moving, you have got this!';
    }
    else if (_bmi>18.5){
      return 'You are considered to be in a healthy weight range for young and middle-aged adults. \nStay fit, you have got this!';
    }
    else{
      return 'You are considered Underweight. \nYou may develop compromised immune functionalities. \nEat right, you have got this!';
    }
  }
}
