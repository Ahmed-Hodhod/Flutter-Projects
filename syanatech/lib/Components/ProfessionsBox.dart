import 'package:syanatech/constants.dart';
import 'package:flutter/material.dart';

class ProfessionsBox extends StatelessWidget {
  final Professions profession1;
  final Professions profession2;
  final bool centeredRow;
  ProfessionsBox(this.profession1, this.profession2, this.centeredRow);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment:
            centeredRow ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Text(
            profession1.toString().split('.')[1],
            style: kProfessionTextStyle,
          ),
          Text(
            profession2 != Professions.None ? ' - ' : '',
            style: kSeparatorTextStyle,
          ),
          Text(
            profession2 != Professions.None
                ? profession2.toString().split('.')[1]
                : '',
            style: kProfessionTextStyle,
          ),
        ],
      ),
    );
  }
}
