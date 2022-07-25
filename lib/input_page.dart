import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'constants.dart';
import 'package:bmi_calculator/results_page.dart';
import 'bottomButton.dart';
import 'package:bmi_calculator/roundIcon.dart';
import 'calculate.dart';

enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 170;
  int weight=60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMI CALCULATOR',
          style: TextStyle(
            color: Colors.white,
            // fontSize: 30.0,
            // fontStyle: FontStyle.italic,
          ),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
            //first row
            Expanded(child: Row(
              children: [
                //container 1
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState((){
                        selectedGender = Gender.male;
                      });
                    },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: iconContents(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE'),),
                ),

                //container 2
                Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState((){
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: iconContents(
                          icon: FontAwesomeIcons.venus,
                          label:'FEMALE'),
                    ),
                ),
                    ],),
            ),//children



            //second row
            Expanded(child: ReusableCard(
                colour: kActiveCardColour,

              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                children: [

                    Text('HEIGHT',
                    style: kLabelTextStyle,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(),
                          style: kNumberTextStyle),

                        Text('CM',
                          style: kLabelTextStyle,),
                      ],
                    ),
                  SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        overlayColor: Color(0x29EB1555),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 27.0),
                        thumbColor: Color(0xFFEB1555),
                      ),
                      child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,

                      onChanged: (double newValue){
                        setState((){
                          height=newValue.round();
                        });
                      }
                  ))
                  ],
                ),
            )),


            //third row
            Expanded(child: Row(
              children: [
                //box 1
                Expanded(
                  child: ReusableCard(
                      colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT',
                          style: kLabelTextStyle,
                      ),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(weight.toString(),
                            style: kNumberTextStyle,),
                          Text('kg',
                            style: kLabelTextStyle,),
                        ],
                      ),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon:FontAwesomeIcons.minus,
                          onPressed: (){
                                setState((){
                                  weight--;
                                });
                          },),

                          SizedBox(width: 15.0),

                          RoundIconButton(
                              icon:FontAwesomeIcons.plus,
                            onPressed: (){
                            setState((){
                              weight++;
                            });
                            },
                          ),

                        ],
                      )

                    ],
                  ),),
                ),


                //box 2
                Expanded(
                  child: ReusableCard(
                      colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE',
                        style: kLabelTextStyle),
                        Text(age.toString(),
                        style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            RoundIconButton(
                                icon:FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState((){
                                    age--;
                                  });
                                },),

                            SizedBox(width: 15.0,),

                            RoundIconButton(
                              icon:FontAwesomeIcons.plus,
                              onPressed: (){
                                setState((){
                                  age++;
                                });
                              },),
                          ],
                        )
                      ],
                    )
                  ),
                ),
              ],//children
            ),),

          BottomButton(
            onTap: (){

              Calculator calc = Calculator(height: height, weight: weight);

              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiresult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      )));
            },
            ButtonTitle: 'CALCULATE',
          ),
          ],//children
      )
    );
  }
}







