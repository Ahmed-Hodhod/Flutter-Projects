import 'package:flutter/material.dart';
import 'package:syanatech/Screeens/PayInCash.dart';
import 'package:syanatech/constants.dart';
import 'PayInCash.dart';
import 'PayInCreditCard.dart';
import 'package:syanatech/Components/PageBlueprint.dart';
import 'package:syanatech/Components/WorkerCard.dart';

class NewOrder extends StatefulWidget {
  static const id = 'NewOrder';
  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  bool inCash = true;

  Widget internalContent() {
    return Container(
      height: double.maxFinite, // Needs to be Dynamic
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Start : Worker Info Box
          WorkerCard(
              'Ahmed Hodhod',
              Professions.Barber,
              Professions.Carpenter,
              4,
              95,
              'images/ana.jpg',
              true,
              () {},
              () {},
              true,
              false,
              false), // Fill it with dynamic data
// End : Worker Info Box

          Container(
            padding: EdgeInsets.only(top: 30, bottom: 10, right: 20, left: 20),
            child: Text(
              'Desired Payment Method',
              style: kOrderDesiredServiceTextStyle,
            ),
          ),
// Start : Payment Method
// We can take only one from these two expaneded boxes
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
                    color: inCash ? kBlueColor : kWhiteColor,
                    borderRadius: BorderRadius.circular(10),
                    border: !inCash
                        ? Border.all(
                            width: 1,
                            color: kOrangeColor,
                          )
                        : Border.all(width: 0),
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
                        color: inCash ? Colors.white : kBlueColor,
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
                    color: !inCash ? kBlueColor : kWhiteColor,
                    borderRadius: BorderRadius.circular(10),
                    border: inCash
                        ? Border.all(
                            width: 1,
                            color: kOrangeColor,
                          )
                        : Border.all(width: 0),
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
                        color: !inCash ? Colors.white : kBlueColor,
                        fontFamily: 'Careem',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
// End : Payment Method

          Container(
            margin: EdgeInsets.only(
              bottom: 40,
            ),
            child: inCash ? PayInCash() : PayInCreditCard(),
          ), // for paying in cash

// Start : Order Now Button

// We can extract this button design to use in ServiceProvider button
          Container(
            margin: EdgeInsets.only(
              top: 10,
              bottom: 30,
              right: 20,
              left: 20,
            ),
            padding: EdgeInsets.all(30),
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
// End : Order Now Button
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(childWidget: internalContent(), title: 'New Order');
  }
}

//TODO : change the activated key ( on cash or creidt card )

// personalize Text field https://stackoverflow.com/questions/50122394/not-able-to-change-textfield-border-color
