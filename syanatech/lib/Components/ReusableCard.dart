import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ReusableCard extends StatefulWidget {
  ReusableCard(this.childWidget);

  final Widget childWidget;
  @override
  _ReusableCardState createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      // InkWell requires a material widget ancestor
      child: InkWell(
        hoverColor: Colors.transparent, // Remove the default effect of hovering
        highlightColor: Colors.transparent,
        onTap: () {},
        onHover: (value) {
          setState(() {
            hover = value;
          });
        },
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          elevation: hover ? 20 : 3,
          child: Padding(
            padding: EdgeInsets.only(top: 30, right: 30, bottom: 20, left: 20),
            child: widget.childWidget,
          ),
        ),
      ),
    );
  }
}
