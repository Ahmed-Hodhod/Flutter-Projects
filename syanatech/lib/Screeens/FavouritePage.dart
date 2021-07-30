import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syanatech/Components/PageBlueprint.dart';
import 'package:syanatech/models/ProfessionalsHandler.dart';
import 'package:syanatech/Components/WorkerCard.dart';
import 'ServiceProvider.dart';

class FavouriteContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final professionalsList =
        Provider.of<ProfessionalsHandler>(context).professionalsList;
    return Container(
      height: 1800,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return WorkerCard(
              professionalsList[index].name,
              professionalsList[index].profession1,
              professionalsList[index].profession2,
              professionalsList[index].rating,
              professionalsList[index].reviewesCount,
              professionalsList[index].url,
              professionalsList[index].loved, () {
            Provider.of<ProfessionalsHandler>(context, listen: false)
                .toggleLoveAtIndex(index);
            //if not loved ? then remove from the favourites
            Provider.of<ProfessionalsHandler>(context, listen: false)
                .professionalsList
                .removeWhere((element) => element == professionalsList[index]);
          }, () {
            Navigator.pushNamed(context, ServiceProvider.id);
          }, false, false, false);
        },
        itemCount: professionalsList.length,
      ),
    );
  }
}

class FavouritePage extends StatelessWidget {
  static const id = 'favourites';

  @override
  Widget build(BuildContext context) {
    return PageTemplate(childWidget: FavouriteContent(), title: 'Favourites');
  }
}
