import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syanatech/constants.dart';

class ReviewBox extends StatelessWidget {
  final rating;
  final reviewsCount;
  final bool centeredRow;
  ReviewBox(this.rating, this.reviewsCount, this.centeredRow);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          centeredRow ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Text(
          'Reviews',
          style: kReviewsTextStyle,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          FontAwesomeIcons.solidStar,
          color: kOrangeColor,
          size: 15,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '$rating ($reviewsCount)',
          style: kRatingTextStyle,
        ),
      ],
    );
  }
}
