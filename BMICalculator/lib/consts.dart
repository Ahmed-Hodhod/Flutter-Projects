import 'package:flutter/material.dart';

const TextStyle iconTextStyle = TextStyle(
  color: Color(0xFF8D8E98),
  fontSize: 18,
);

const sliderTextStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w900,
);

// by convention, name of a constant starts with 'k'
// So, kBottomBarHeight is more proper
const double bottomBarHeight = 80;
const Color activeCardColor = Color(0xFF1D1E33);
const Color inactiveCardColor = Color(0xFF111328);

const Color bottomContinerColor = Colors.red;

const TextStyle kBigTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 25,
  fontWeight: FontWeight.bold,
);
const TextStyle kResultTextStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold,
);
const TextStyle kCaseTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: Colors.green,
);

const TextStyle kBMITextStyle = TextStyle(
  fontSize: 100,
  fontWeight: FontWeight.bold,
);

enum Gender {
  MALE, // = 0
  FEMALE, // = 1
  NONE
}
