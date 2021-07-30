import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Icons
const IconData kInActiveFavouriteIcon = FontAwesomeIcons.heart;

const IconData kActiveFavouriteIcon = FontAwesomeIcons.solidHeart;

// Suggested : Later, we can let the admin add to this enum through an interface
enum Professions { Carpenter, Blumber, Barber, PrivateTutor, None }

// Colors
const Color kWhiteColor = Color(0x00000029);
const Color kOrangeColor = Color(0xFFF3B00E);
const Color kBlueColor = Color(0xFF395991);
const Color kYellowColor = Color(0xFFF5EA4E);
const Color kBlackColor = Color(0xFF2E2E2E);
const Color kGreyColor = Colors.grey;
const TextStyle kNameTextStyle = TextStyle(
  fontFamily: 'Careem',
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

const TextStyle kProfessionTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: kOrangeColor,
);

const TextStyle kSeparatorTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Colors.blueGrey,
);

const TextStyle kReviewsTextStyle = TextStyle(
  fontFamily: 'Careem',
  color: kGreyColor,
  fontSize: 20,
);

const TextStyle kRatingTextStyle = TextStyle(
  fontSize: 18,
  color: kBlueColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'Careem',
);

const TextStyle kTestmonialNameTextStyle = TextStyle(
  fontSize: 12,
  fontFamily: 'Careem',
  fontWeight: FontWeight.bold,
  color: Color(0xFF2E2E2E),
  decoration: TextDecoration.none,
);

const TextStyle kTestmonialContentTextStyle = TextStyle(
  fontSize: 14,
  fontFamily: 'Careem',
  fontWeight: FontWeight.bold,
  color: Color(0xFF818181),
  decoration: TextDecoration.none,
);

const TextStyle kServiceDescriptionTextStyle = TextStyle(
  color: Color(0xFF2E2E2E),
  fontFamily: 'Careem',
  fontSize: 20,
);

const TextStyle kApplyForServiceButton =
    TextStyle(color: Colors.white, fontFamily: 'Careem', fontSize: 24);

const kServiceHeadings = TextStyle(
  fontFamily: 'Careem',
  fontSize: 20,
);

const kOrderDesiredServiceTextStyle = TextStyle(
  color: Color(0xFFF3B00E),
  fontSize: 18,
  fontWeight: FontWeight.w400,
  fontFamily: 'Careem',
);
