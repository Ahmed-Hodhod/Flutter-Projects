import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorBrain {
  CalculatorBrain(this.height, this.weight);
  final double height;
  final double weight;

  double _bmi = 0;
  String calcBMI() {
    _bmi = weight / sqrt(height / 100);
    return _bmi.round().toString();
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight!';
    } else if (_bmi > 18.5) {
      return 'Normal1';
    } else {
      return 'UnderWeight!';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You need to lose some weight. it is recommended to start a diet !';
    } else if (_bmi > 18.5) {
      return 'You don\'t need to do anything. Enjoy your life!';
    } else {
      return 'You need to gain some weight. Prefered to be of muscles. !';
    }
  }
}
