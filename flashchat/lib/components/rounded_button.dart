import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(this.title, this.color, this.callback);
  final String title;
  final Color color;
  final Function() callback;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(),
          ),
        ),
      ),
    );
  }
}
