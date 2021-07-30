import 'package:syanatech/Screeens/FavouritePage.dart';
import 'package:flutter/material.dart';
import 'package:syanatech/Screeens/ServiceProvider.dart';
import 'models/ProfessionalsHandler.dart';
import 'package:provider/provider.dart';
import 'Screeens/NewOrder.dart';

void main() {
  //print(Professions.Blumber.toString().split('.')[1]);
  runApp(
    ChangeNotifierProvider<ProfessionalsHandler>(
      create: (_) => ProfessionalsHandler(),
      child: MaterialApp(
        initialRoute: FavouritePage.id,
        routes: {
          FavouritePage.id: (_) => FavouritePage(),
          ServiceProvider.id: (_) => ServiceProvider(),
          NewOrder.id: (_) => NewOrder(),

          // Add other pages
        },
        home: SafeArea(
          child: FavouritePage(),
        ),
      ),
    ),
  );
}
