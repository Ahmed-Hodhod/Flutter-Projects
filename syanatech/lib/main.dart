import 'package:syanatech/Components/ReusableBox.dart';
import 'package:syanatech/Screeens/Favourites.dart';

import 'package:flutter/material.dart';
import 'package:syanatech/Screeens/NewOrder.dart';
import 'package:syanatech/Screeens/ServiceProvider.dart';
import 'Components/ReusableBox.dart';
import 'Screeens/Favourites.dart';

void main() {
  runApp(MaterialApp(
    home: SafeArea(
      child: Favourites(),
    ),
  ));
}


//  SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children: [
//             ResuableBox(5),
//             ResuableBox(5),
//             ResuableBox(5),
//             ResuableBox(5),
//             ResuableBox(5),
//           ],
//         ),
//       ),