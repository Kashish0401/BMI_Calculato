import 'package:bmi_calc/constants.dart';
import 'package:bmi_calc/top_cards.dart';
import 'calculate_button.dart';
import 'package:flutter/material.dart';

class CalculationsPage extends StatelessWidget {
  final String bmiResult;
  final String Result;
  final String Interpretation;

  CalculationsPage(this.bmiResult, this.Result, this.Interpretation);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 15, 8, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 5,
              child: TopCards(
                kactiveCardColour,
                (Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        Result,
                        style: TextStyle(
                            color: Color(0xFF24D876),
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        bmiResult,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 100),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      Interpretation,
                      style: TextStyle(
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ))
                  ],
                )),
              ),
            ),
            CalculateButton('Re-Calculate', () {
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    ));
  }
}
