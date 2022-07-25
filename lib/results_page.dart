import 'package:bmi_calculator/bottomButton.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'calculate.dart';


class ResultsPage extends StatelessWidget {

  ResultsPage ({@required this.bmiresult, @required this.resultText, @required this.interpretation});

  final String bmiresult;
  final String resultText;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMI CALCULATOR',
        style: TextStyle(
          color: Colors.white,
        ),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Center(
              child: Text('YOUR RESULT',
              style: kTitleTextStyle,),
            ),
          ),
          ),
          Expanded(
              flex:5,
              child: ReusableCard(
            colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultText,
                    style: kResultTextStyle),
                    Text(bmiresult,
                    style: kBMITextStyle),
                    Text(interpretation,
                    style:kBodyTextStyle,
                    textAlign: TextAlign.center,)
                  ],
                ),
          )),
          BottomButton(onTap: (){
            Navigator.pop(context);},
              ButtonTitle: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
