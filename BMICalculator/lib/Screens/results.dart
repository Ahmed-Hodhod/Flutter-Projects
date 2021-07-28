import 'package:flutter/material.dart';

import 'package:bmi_calculator/consts.dart';
import 'package:bmi_calculator/Components/reusable_container.dart';
import 'package:bmi_calculator/Components/buttom_button.dart';

class BMI_Calc extends StatelessWidget {
  BMI_Calc(this.BMI, this.result, this.interpretation);
  final String BMI;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Text(
                'Your results',
                style: kResultTextStyle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableContainer(
                  activeCardColor,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        result,
                        style: kCaseTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        BMI,
                        style: kBMITextStyle,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        interpretation,
                        style: iconTextStyle,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  () {})),
          Expanded(
              child: BottomButton('RE-CALCULATE', () {
            Navigator.pop(context);
          }))
        ],
      ),
    );
  }
}
