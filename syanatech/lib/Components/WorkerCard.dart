import 'package:flutter/material.dart';
import 'ReusableCard.dart';
import 'package:syanatech/constants.dart';
import 'ReusableImageFrame.dart';
import 'ProfessionsBox.dart';
import 'ReviewsBox.dart';

class WorkerCard extends StatelessWidget {
  WorkerCard(
    this.name,
    this.profession1,
    this.profession2,
    this.rating,
    this.reviewsCount,
    this.url,
    this.loved, // ASSUMED TO BE INITIALLY TRUE
    this.toggleLoveCallback,
    this.onTapCallback,
    this.hover,
    this.centeredReviewRow,
    this.centeredProfessionRow,
  );

  final String name;
  final Professions profession1;
  final Professions profession2;
  final double rating;
  final int reviewsCount;
  final String url;
  final bool loved;
  final Function toggleLoveCallback;
  final Function onTapCallback;

  final bool hover;
  final bool centeredReviewRow;
  final bool centeredProfessionRow;

  Widget internalContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: ReusableImageFrame(
            hover: hover,
            url: url,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 12,
          child: GestureDetector(
            onTapDown: (_) {
              onTapCallback();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: kNameTextStyle,
                ),
                ProfessionsBox(
                  profession1,
                  profession2,
                  centeredProfessionRow,
                ),
                ReviewBox(
                  rating,
                  reviewsCount,
                  centeredReviewRow,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              toggleLoveCallback();
            },
            child: Icon(
              loved ? kActiveFavouriteIcon : kInActiveFavouriteIcon,
              color: kOrangeColor,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      internalContent(),
    );
  }
}
