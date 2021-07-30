import 'package:flutter/cupertino.dart';
import 'package:syanatech/constants.dart';
import 'professionalData.dart';

class ProfessionalsHandler extends ChangeNotifier {
  // Assumption : all items are favourites
  // Suggestion : We can have an additional list for favourties only

  //ADD all professionals here
  List<ProffesionlData> professionalsList = [
    ProffesionlData(
      name: 'Ahmed Hodhod',
      profession1: Professions.Carpenter,
      profession2: Professions.Blumber,
      loved: true,
      rating: 4.5,
      reviewesCount: 25,
    ),
    ProffesionlData(
      name: 'Ali Tarek',
      profession1: Professions.Carpenter,
      profession2: Professions.Barber,
      loved: true,
      url: 'images/ana.jpg',
      rating: 4.5,
      reviewesCount: 25,
    ),
    ProffesionlData(
      name: 'Khalid 3lesh',
      profession1: Professions.Carpenter,
      profession2: Professions.PrivateTutor,
      loved: true,
    ),
  ];

  void toggleLoveAtIndex(int index) {
    professionalsList[index].toggleLove();
    notifyListeners();
  }
}
