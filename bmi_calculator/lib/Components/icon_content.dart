import 'package:flutter/material.dart';

import 'package:bmi_calculator/consts.dart';

// The inner of the two boxes (Male, Female) has the same structure
class reusableIcon extends StatelessWidget {
  reusableIcon(this.text, this.icon);
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: iconTextStyle,
        )
      ],
    );
  }
}
