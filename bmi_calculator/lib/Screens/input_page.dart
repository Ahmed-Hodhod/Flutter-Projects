import 'package:bmi_calculator/Calculator_Brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Components/reusable_container.dart';
import 'package:bmi_calculator/Components/icon_content.dart';
import 'package:bmi_calculator/consts.dart';
import 'package:bmi_calculator/Components/buttom_button.dart';
import '../Components/RoundedIconButton.dart';
import 'results.dart';

// If there is some value that it is probably to change later in the development
// process, feel free to create const vars at the top level of your code
// to refer to them whenever there is a change

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.NONE;
  double _currentSliderValue = 160;
  double wieght = 20;
  double age = 10;
  // Color maleCurrentColor = inactiveCardColor;
  // Color femaleCurrentColor = inactiveCardColor;

  // void updateColour(Gender gender) {
  //   if (gender == Gender.MALE) {
  //     if (maleCurrentColor == inactiveCardColor) {
  //       maleCurrentColor = activeCardColor;
  //       femaleCurrentColor = inactiveCardColor;
  //     } else {
  //       maleCurrentColor = inactiveCardColor;
  //     }
  //   }
  //   if (gender == Gender.FEMALE) {
  //     if (femaleCurrentColor == inactiveCardColor) {
  //       femaleCurrentColor = activeCardColor;
  //       maleCurrentColor = inactiveCardColor;
  //     } else {
  //       femaleCurrentColor = inactiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableContainer(
                      selectedGender == Gender.MALE
                          ? activeCardColor
                          : inactiveCardColor,
                      reusableIcon('MALE', FontAwesomeIcons.mars), () {
                    setState(() {
                      selectedGender = Gender.MALE;
                    });
                  }),
                ),
                Expanded(
                  child: ReusableContainer(
                      selectedGender == Gender.FEMALE
                          ? activeCardColor
                          : inactiveCardColor,
                      reusableIcon('FEMALE', FontAwesomeIcons.venus), () {
                    setState(() {
                      selectedGender = Gender.FEMALE;
                    });
                  }),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableContainer(
                activeCardColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HELLO',
                      style: iconTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          _currentSliderValue.round().toString(),
                          style: sliderTextStyle,
                        ),
                        Text(
                          'cm',
                          style: iconTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      // if you want to apply this style to all sliders in your
                      // app, paste the content of CopyWith constructor below
                      // to theme property of MaterialApp
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        value: _currentSliderValue,
                        min: 120,
                        max: 220,
                        inactiveColor: Colors.white,
                        // divisions: 5,
                        label: _currentSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
                () {}),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableContainer(
                      activeCardColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: iconTextStyle,
                          ),
                          Text(
                            wieght.toString(),
                            style: sliderTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedIconButton(FontAwesomeIcons.minus, () {
                                setState(() {
                                  if (wieght > 0) {
                                    wieght--;
                                  }
                                });
                              }),
                              SizedBox(
                                width: 10,
                              ),
                              RoundedIconButton(FontAwesomeIcons.plus, () {
                                setState(() {
                                  wieght++;
                                });
                              })
                            ],
                          ),
                        ],
                      ),
                      () {}),
                ),
                Expanded(
                  child: ReusableContainer(
                      activeCardColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: iconTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: sliderTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedIconButton(FontAwesomeIcons.minus, () {
                                setState(() {
                                  if (age > 10) {
                                    age--;
                                  }
                                });
                              }),
                              SizedBox(
                                width: 10,
                              ),
                              RoundedIconButton(FontAwesomeIcons.plus, () {
                                setState(() {
                                  age++;
                                });
                              })
                            ],
                          ),
                        ],
                      ),
                      () {}),
                )
              ],
            ),
          ),
          BottomButton('CALCULATE', () {
            CalculatorBrain bmi = CalculatorBrain(_currentSliderValue, wieght);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BMI_Calc(bmi.calcBMI(),
                        bmi.getResult(), bmi.getInterpretation())));
          })
        ],
      ),
    );
  }
}
