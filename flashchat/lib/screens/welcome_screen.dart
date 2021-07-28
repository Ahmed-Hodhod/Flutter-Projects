import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    //R. You must have this Mixin
    with
        SingleTickerProviderStateMixin {
  //R. Controller
  AnimationController controller;

  // Not. R.
  Animation animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
      // upperBound: 100,
    );
    super.initState();

    // R.
    // Try : controller.reverse(from:1 ); if u r using CurvedAnimation,
    //then choose a value less than one and greater than zero.

    controller.forward();

    // R.
    // addListener: animation value changes from a LowerBound to an UpperBound
    // By default,lowerbound = 0, upperbound = 1 (Changeable).
    // You can employ the changing value of the controller to do some function
    // such as changing the opacity from 0 to one through 1 second.
    // or changing the size of the image from 0 to 100 pixels.
    /*   animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    // Now you can use animation.value instead of controller.value

    // To have an iterative animation
      animation.addStatusListener((status) {
        if (animation.status ==
            AnimationStatus.completed) // End of Forward animation from 0 to 1
        {
          controller.reverse(from: 1);
        } else if (animation.status ==
            AnimationStatus.dismissed) // End of reverse animation from 1 to 0
        {
          controller.forward();
        }
      });
      (animation.isCompleted)
          ? controller.reverse(from: 1.0)
          : controller.forward(); */

    ///// Color Tween animation (begin and end )

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.addListener(() {
      setState(() {}); // R. Important.

      //print(controller.value);
    }); // End of InitState

    /**
    
     * By default, the animation value change evenly ( usually, the second is 
     * divided into 60 ticks. )
    
     * Instead, you can have the animation values changes on a curve not evenly 
     * using the class "AnimationCurvedClass" . In this case, the range of values 
     * accelerate or decelerate between 0 & 1. 
     */
  }

  //Required.

  @override
  void dispose() {
    // (Destrcutor)
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Try this as an example of Animation
      //backgroundColor: Colors.red.withOpacity(controller.value),
      backgroundColor: animation.value,
      // backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      //R. Try This
                      //height: controller.value,
                      //height: animation.value * 100,
                      height: 60.0,
                    ),
                  ),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Flash Chat'),
                      TypewriterAnimatedText('Flash Chat'),
                      TypewriterAnimatedText('Flash Chat'),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton('Log In', Colors.lightBlueAccent, () {
              Navigator.pushNamed(context, LoginScreen.id);
            }),
            RoundedButton('Register', Colors.blueAccent, () {
              Navigator.pushNamed(context, RegistrationScreen.id);
            }),
          ],
        ),
      ),
    );
  }
}
