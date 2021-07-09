import 'package:flutter/material.dart';

// Our totally Customized button ( depending  on Raw Material Button )
class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton(this.icon, this.onPress);
  final Function() onPress;
  final IconData icon;
  @override
  // Lookup the documentation of RawMaterialButton CLASS to know about its props
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 6,
      child: Icon(
        icon,
        color: Colors.white,
      ),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
