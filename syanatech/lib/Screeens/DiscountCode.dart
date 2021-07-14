import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DiscountCode extends StatefulWidget {
  const DiscountCode({Key? key}) : super(key: key);

  @override
  _DiscountCodeState createState() => _DiscountCodeState();
}

class _DiscountCodeState extends State<DiscountCode> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            child: Theme(
              data: ThemeData(
                primaryColor: Colors.redAccent,
                primaryColorDark: Colors.red,
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    hintText: 'Enter your Discount Code',
                    suffixIcon: const Icon(
                      FontAwesomeIcons.book,
                      color: Colors.grey,
                    ),
                    prefixText: ' ',
                    suffixStyle: const TextStyle(color: Colors.green)),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.only(
              right: 20,
              left: 10,
              top: 20,
            ),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFFF3B00E),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Verify',
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
    );
  }
}
