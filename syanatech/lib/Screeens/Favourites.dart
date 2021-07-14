import 'package:flutter/material.dart';
import 'package:syanatech/Components/ReusableCard.dart';

class Favourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Center(
          child: Text('Favourites',
              style: TextStyle(
                color: Color(0xFF395991),
                fontFamily: 'Careem',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ReusableCard('احمد هدهد', 'مهندس', 'حبوب', 5, 52),
            ReusableCard('Ahmed Hodhod', 'Engineer', 'Footballer', 5, 52),
            ReusableCard('Ahmed Hodhod', 'Engineer', 'Footballer', 5, 52),
            ReusableCard('Ahmed Hodhod', 'Engineer', 'Footballer', 5, 52),
            ReusableCard('Ahmed Hodhod', 'Engineer', 'Footballer', 5, 52),
            ReusableCard('Ahmed Hodhod', 'Engineer', 'Footballer', 5, 52),
            ReusableCard('Ahmed Hodhod', 'Engineer', 'Footballer', 5, 52),
            ReusableCard('Ahmed Hodhod', 'Engineer', 'Footballer', 5, 52),
          ],
        ),
      ),
    );
  }
}

/**
 * 
 * Scrolling : https://stackoverflow.com/questions/52053850/flutter-how-to-make-a-column-screen-scrollable
 * 
 * 
 */
 