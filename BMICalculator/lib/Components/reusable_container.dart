import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  ReusableContainer(this.colour, this.cardChild, this.onPress);
  final Color colour;

  // Provide a child property to your custom widget
  final Widget cardChild;
  final Function() onPress;
  // use Function() or VOIDCALLBACK
//Functions are first-class citizens:
//  https://stackoverflow.com/questions/64484113/the-argument-type-function-cant-be-assigned-to-the-parameter-type-void-funct
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          child: cardChild,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10),
            // When using Decoration for Container,Make
            // sure to set the color property from inside the BoxDecoration object
          )),
    );
  }
}
