import 'package:flutter/material.dart';

// This container will be repeated more than once
class ReusableContainer extends StatelessWidget {
  ReusableContainer(this.colour, this.cardChild, this.onPress);
  // Set Your own constructor instead of the default one
  final Color colour;

  // Provide a child property to your custom widget
  final Widget cardChild;
  final Function() onPress; // Notice : WE DIDNOT USE Function keyword here?
  // use Function() or VOIDCALLBACK
// The answr to this question : https://stackoverflow.com/questions/64484113/the-argument-type-function-cant-be-assigned-to-the-parameter-type-void-funct
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
