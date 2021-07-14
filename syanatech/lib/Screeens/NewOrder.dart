import 'dart:html';

import 'package:flutter/material.dart';

import 'package:syanatech/Screeens/PayInCash.dart';
import 'package:syanatech/Components/ReusableCard.dart';
import 'PayInCash.dart';
import 'PayInCreditCard.dart';

class NewOrder extends StatefulWidget {
  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  bool inCash = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Center(
          child: Text(
            'New Order',
            style: TextStyle(
              color: Color(0xFF395991),
              fontFamily: 'Careem',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ReusableCard('Ahmed Hodhod', 'Engineer', 'Footballer', 5, 52),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              'Desired Payment Method',
              style: TextStyle(
                color: Color(0xFFF3B00E),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Careem',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 5,
                  ),
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Color(0xFF395991),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        inCash = true;
                      });
                    },
                    child: Text(
                      'Pay in Cach',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Careem',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    right: 20,
                    left: 5,
                  ),
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Color(0xFF395991),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        inCash = false;
                      });
                    },
                    child: Text(
                      'Credit Card',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Careem',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          inCash ? PayInCash() : PayInCreditCard(), // for paying in cash
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
                  'New Order',
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
//TODO : change the activated key ( on cash or creidt card )

// personalize Text field https://stackoverflow.com/questions/50122394/not-able-to-change-textfield-border-color
