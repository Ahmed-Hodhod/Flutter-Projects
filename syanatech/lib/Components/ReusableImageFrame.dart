import 'package:flutter/material.dart';
import 'package:syanatech/constants.dart';

// This frame can be either Hovered or not ( decided by hover property )
class ReusableImageFrame extends StatelessWidget {
  ReusableImageFrame({
    Key? key,
    required this.hover,
    required this.url,
  }) : super(key: key);
  final String url;
  final bool hover;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0),
      child: Material(
        elevation: hover ? 10 : 2,
        shape: CircleBorder(
            side: BorderSide(
          color: kWhiteColor,
        )),
        color: kWhiteColor,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 42,
          child: CircleAvatar(
            radius: 40,
            foregroundImage: AssetImage(url),
          ),
        ),
      ),
    );
  }
}
