import 'package:flutter/material.dart';
import 'package:syanatech/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResuableBox extends StatelessWidget {
  ResuableBox(int rating) {
    for (int i = 0; i < rating; i++) {
      stars.add(
        Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xFFF5EA4E),
          size: 10,
        ),
      );
    }
  }
  final List<Icon> stars = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 5,
            blurRadius: 6,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      width: 250,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                child: CircleAvatar(
                  radius: 25,
                  child: CircleAvatar(
                    radius: 25,
                    foregroundImage: AssetImage('images/ana.jpg'),
                    foregroundColor: Colors.black,
                    backgroundImage: AssetImage('images/ana.jpg'),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Ahmed Hodhod',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Careem',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E2E2E),
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: stars,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Thanks for them! They are good ! They are beautiful !',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Careem',
                fontWeight: FontWeight.bold,
                color: Color(0xFF818181),
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
