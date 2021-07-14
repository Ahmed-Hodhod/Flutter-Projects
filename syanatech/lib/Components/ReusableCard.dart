import 'package:flutter/material.dart';
import 'package:syanatech/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReusableCard extends StatefulWidget {
  const ReusableCard(this.name, this.profession1, this.profession2, this.rating,
      this.reviewers);

  final String name;
  final String profession1; // can be changed later to be an enum
  final String profession2; // can be changed later to be an enum
  final double rating;
  final int reviewers;
  @override
  _ReusableCardState createState() => _ReusableCardState();
}

IconData icon = icon1;

class _ReusableCardState extends State<ReusableCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 150, // Remove this
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
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
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 33, // Fixed pixels
      ),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Material(
                elevation: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                color: Color(0x00000029),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 45,
                  child: CircleAvatar(
                    radius: 42,
                    foregroundImage: AssetImage('images/ana.jpg'),
                    foregroundColor: Colors.black,
                    backgroundImage: AssetImage('images/ana.jpg'),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 12,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 17,
                  horizontal: 18,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            fontFamily: 'Careem',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              icon = icon == icon1 ? icon2 : icon1;
                            });
                          },
                          child: Icon(
                            icon,
                            color: Color(0xFFF3B00E),
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.profession1,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF3B00E),
                          ),
                        ),
                        Text(
                          ' - ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Text(
                          widget.profession2,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF3B00E),
                          ),
                        ),
                        // lessa el style hena
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Text(
                          'Reviews',
                          style: TextStyle(
                            fontFamily: 'Careem',
                            color: Color(0xFF8E8E8E),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Icon(
                          FontAwesomeIcons.solidStar,
                          color: Color(0xFFF3B00E),
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${widget.rating} (${widget.reviewers})',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF395991),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

/**
 * 
 * 
 * Creating a reusable compoennt as a stateful widget 
 */
//  Instead : Card + Elevation 