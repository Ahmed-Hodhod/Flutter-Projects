import 'dart:html';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syanatech/Components/ReusableBox.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:syanatech/Components/ReusableCard.dart';

import 'package:syanatech/Components/getCurrentPosition.dart';

class ServiceProvider extends StatelessWidget {
  Future<Position> position = Geolocator.getCurrentPosition();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Center(
          child: Text('Service Provider',
              style: TextStyle(
                color: Color(0xFF395991),
                fontFamily: 'Careem',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child:
                ReusableCard('Ahmed Hodhod', 'Engineer', 'Footballer', 5, 52),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                'Distance between you ',
                style: TextStyle(
                  color: Color(0xFF2B2B2B),
                  fontFamily: 'Careem',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                FontAwesomeIcons.mapMarker,
                color: Color(0xFF395991),
                size: 18,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                '22 meter',
                style: TextStyle(
                  color: Color(0xFF395991),
                  fontFamily: 'Careem',
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Services Provided Pics',
                        style: TextStyle(
                          fontFamily: 'Careem',
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Image(
                          image: AssetImage('images/ana.jpg'),
                        ),
                      ),
                      Expanded(
                        child: Image(
                          image: AssetImage('images/ana.jpg'),
                        ),
                      ),
                      Expanded(
                        child: Image(
                          image: AssetImage('images/ana.jpg'),
                        ),
                      ),
                      Expanded(
                        child: Image(
                          image: AssetImage('images/ana.jpg'),
                        ),
                      ),
                      Expanded(
                        child: Image(
                          image: AssetImage('images/ana.jpg'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Expanded(
            flex: 4,
            // Reviews bar
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Reviews',
                      style: TextStyle(
                        fontFamily: 'Careem',
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      FontAwesomeIcons.solidStar,
                      size: 15,
                      color: Color(0xFFF5EA4E),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '4.9',
                      style: TextStyle(
                        fontFamily: 'Careem',
                        fontSize: 18,
                        color: Color(0xFFA7A7A7),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ResuableBox(5),
                        ResuableBox(5),
                        ResuableBox(5),
                        ResuableBox(5),
                        ResuableBox(5),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            // Service Description
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Service Description',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFF2E2E2E),
                      fontFamily: 'Careem',
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'datadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata',
                    style: TextStyle(
                      color: Color(0xFFA7A7A7),
                      fontFamily: 'Careem',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Color(0xFF395991),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Apply for Service',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Careem',
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/**
 * 
 * https://pub.dev/packages/geolocator can be used to measure 
 * the distance between two points 
 * 
 * query : await keyword
 * 
 * 
 * Location : https://stackoverflow.com/questions/64677982/calculate-distance-between-previous-location-and-current-location-in-flutter
 */
