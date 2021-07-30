import 'package:flutter/material.dart';
import 'package:syanatech/Components/ReusableCard.dart';
import 'package:syanatech/Components/ReusableImageFrame.dart';
import 'package:syanatech/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReusableBox extends StatelessWidget {
  ReusableBox(
      {required this.url,
      required this.name,
      required this.rating,
      required this.content}) {
    for (int i = 0; i < rating; i++) {
      stars.add(
        Icon(
          FontAwesomeIcons.solidStar,
          color: kYellowColor,
          size: 10,
        ),
      );
    }
  }
  final String url;
  final String name;
  final int rating; // Change this later to be double
  final String content;

  Widget internalContent() {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Expanded(
                flex: 2,
                child: ReusableImageFrame(hover: false, url: url),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      name,
                      style: kTestmonialNameTextStyle,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: stars,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Text(
            content,
            style: kTestmonialContentTextStyle,
          ),
        ),
      ],
    );
  }

  final List<Icon> stars = [];
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      internalContent(),
    );
  }
}

/**
 
  color: Colors.transparent,
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child:


 */
