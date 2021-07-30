import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:syanatech/Components/ProfessionsBox.dart';
import 'package:syanatech/Components/ReusableBox.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:syanatech/Components/PageBlueprint.dart';

import 'package:syanatech/Components/ReusableImageFrame.dart';
import 'package:syanatech/Components/ReviewsBox.dart';
import 'package:syanatech/Screeens/NewOrder.dart';
import 'package:syanatech/constants.dart';

import 'package:syanatech/models/TestmonialManger.dart';

class ServiceProviderContent extends StatelessWidget {
  Future<Position> position = Geolocator.getCurrentPosition();

  @override
  Widget build(BuildContext context) {
    return Container(
      // it is a must to be put inside sliverFillRemaining
      height: 950, // Issue by Hodhod : it needs to be dynamic
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
//Start : Worker Info
          Padding(
            padding: const EdgeInsets.only(
              bottom: 30,
              top: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReusableImageFrame(hover: false, url: 'images/ana.jpg'),
                Text(
                  'Ahmed Hodhod',
                  style: kNameTextStyle,
                ),
                ProfessionsBox(Professions.Barber, Professions.Carpenter, true),
                ReviewBox(4, 52, true),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Distance between you ',
                      style: kNameTextStyle,
                    ),
                    Icon(
                      FontAwesomeIcons.mapMarker,
                      color: kBlackColor,
                      size: 18,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      '22 meter',
                      style: kRatingTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),

// End : Worker Info

// Start : Service Pics
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Services Provided Pics',
                    style: kServiceHeadings,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    ServicePictureFrame(), // List as many pics as you want
                    ServicePictureFrame(), // List as many pics as you want
                    ServicePictureFrame(), // List as many pics as you want
                    // List as many pics as you want
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 7,
          ),
// End : Service Pics

          // Start : Testmonials
          Expanded(
            child: Column(
              children: [
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Reviews',
                      style: kServiceHeadings,
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
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      var reviewr = TestmonialManager().reviwers[index];
                      return Container(
                        width: 300,
                        child: ReusableBox(
                          url: reviewr.url,
                          name: reviewr.name,
                          content: reviewr.content,
                          rating: reviewr.stars,
                        ),
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: TestmonialManager().reviwers.length,
                  ),
                ),
              ],
            ),
          ),
// End : Testmonials

//Start:  Service Description

          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Service Description',
                  style: kServiceDescriptionTextStyle,
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  'This is a dummy description. If you are looking for details, it is not the time because It is thursday and tommorrow I am travelling to Cairo!',
                  style: kTestmonialContentTextStyle,
                ),
              ],
            ),
          ),
// End: Servcie Description

// Start : Apply for the Service

          Container(
            width: double.infinity,
            child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 40),
              color: kBlueColor,
              onPressed: () {
                Navigator.pushNamed(context, NewOrder.id);
                // Pass the data or have its index stored in the Manager, Handler
              },
              child: Text(
                'Apply for Service',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          )
// End : Apply for the Service
        ],
      ),
    );
  }
}

class ServiceProvider extends StatelessWidget {
  static const id = 'serviceProvider';
  const ServiceProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
        childWidget: ServiceProviderContent(), title: 'Service Provider');
  }
}

class ServicePictureFrame extends StatefulWidget {
  const ServicePictureFrame({Key? key}) : super(key: key);

  @override
  _ServicePictureFrameState createState() => _ServicePictureFrameState();
}

class _ServicePictureFrameState extends State<ServicePictureFrame> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Container(
        width: 150,
        height: 150,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          image: DecorationImage(
            image: AssetImage(
              'images/ana.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
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
