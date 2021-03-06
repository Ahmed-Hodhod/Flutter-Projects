import 'package:flutter/material.dart';
import 'DiscountCode.dart';
import 'package:syanatech/Screeens/DiscountCode.dart';

class PayInCash extends StatefulWidget {
  const PayInCash({Key? key}) : super(key: key);

  @override
  _PayInCashState createState() => _PayInCashState();
}

class _PayInCashState extends State<PayInCash> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Column(
        children: [
          Column(
            children: [
              DiscountCode(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Expected Sum',
                style: TextStyle(
                  color: Color(0xFF395991),
                  fontSize: 20,
                  fontFamily: 'Careem',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '200',
                    style: TextStyle(
                      color: Color(0xFF395991),
                      fontFamily: 'Careem',
                      fontSize: 35,
                    ),
                  ),
                  Text(
                    '  L.E',
                    style: TextStyle(
                      color: Color(0xFFF3B00E),
                      fontSize: 25,
                      fontFamily: 'Careem',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
