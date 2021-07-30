import 'package:flutter/cupertino.dart';
import 'package:syanatech/constants.dart';

class ProffesionlData {
  String name;
  Professions profession1;
  Professions profession2;
  int reviewesCount;
  double rating;
  bool loved;
  String url;
  ProffesionlData({
    required this.name,
    required this.profession1,
    this.profession2 = Professions.None,
    this.reviewesCount = 0,
    this.rating = 0,
    this.url = '../images/avatar.jpg',
    this.loved = false,
  });

  void toggleLove() {
    loved = !loved;
  }
}
