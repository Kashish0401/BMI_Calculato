import 'package:bmi_calc/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'top_cards.dart';
import 'icontext.dart';
import 'constants.dart';
import 'calculations_page.dart';
import 'calculate_button.dart';
import 'calci_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.notSelected;

  int height = 180;
  int weight = 60;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                        //print('male card ');
                      });
                    },
                    child: TopCards(
                        selectedGender == Gender.male
                            ? kactiveCardColour
                            : kinactiveCardColor,
                        (IconText(FontAwesomeIcons.mars, 'MALE'))),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                        //print('female card ');
                      });
                    },
                    child: TopCards(
                        selectedGender == Gender.female
                            ? kactiveCardColour
                            : kinactiveCardColor,
                        (IconText(FontAwesomeIcons.marsAndVenus, 'FEMALE'))),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TopCards(
              kactiveCardColour,
              (Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: klabelTextStyleSmaller,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kTextStyleBigger,
                      ),
                      Text(
                        'cm',
                        style: klabelTextStyleSmaller,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15,
                            pressedElevation: 10,
                            elevation: 5),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                        trackHeight: 1),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 280,
                      onChanged: (double newValue) {
                        setState(
                          () {
                            height = newValue.round();
                          },
                        );
                      },
                    ),
                  ),
                ],
              )),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: TopCards(
                    kactiveCardColour,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: klabelTextStyleSmaller,
                        ),
                        Text(
                          weight.toString(),
                          style: kTextStyleBigger,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              FontAwesomeIcons.minus,
                              () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundIconButton(FontAwesomeIcons.add, () {
                              setState(() {
                                weight++;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TopCards(
                    kactiveCardColour,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: klabelTextStyleSmaller,
                        ),
                        Text(
                          age.toString(),
                          style: kTextStyleBigger,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              FontAwesomeIcons.minus,
                              () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundIconButton(FontAwesomeIcons.add, () {
                              setState(() {
                                age++;
                              });
                            })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CalculateButton(
            'Calculate',
            () {
              CalculatorBrain calc = CalculatorBrain(weight, height);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CalculationsPage(calc.CalcBMI(), calc.GetResult(),
                        calc.getInterpretation());
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
