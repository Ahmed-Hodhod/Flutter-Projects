import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  theme: ThemeData.dark(),
      //home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        WelcomeScreen.id: (context) => WelcomeScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}


/**
 * If you are going to name routes using Forward-Slash notation, 
 * make sure to have one with nothing after it.  '/', '/login' ...etc
 * in order for your app not to crash. 
 * 
 * we will use const static id for each screen instead of hard-
 *  coded names in routes property 
 * 
 * but it is better to have an ID for each screen. 
 * 
 * 
 * * ** Hero Animations of Flutter **** *
 *  commonly happems when transitioning from one page to another where there are 
 *  shared elements between the two screens.  look the docs up for hero animations. 
 * 
 *  you can use the same tag for multiple screens with shared elements between them. 
 * 
 * 
 * 
 * to read : 
 * hero animations ( flutter docs )
 * hero widget 
 *  Use Hero Widget ? 
 *  . locate the shared element bet. multiple screens
 *  . wrap the shared element with a Hero widget in all screens. 
 *  . set the tag property for all common elements to have the same value 
 * 
 * 
 * 
 * ** Custom Animaitons *** 
 * An animation is basically composed of three things : 
 *  . A ticker 
 *  . Animation Controller  : Manager ( tells the anime to start, stop, last for a period, ..)
 *  . Animation Value : usually from 0 to 1 ( )
 * 
 * 
 * 
 * Steps : 
 * 1. Build AnimationController 
 * 2. look up welcome page 
 * 
 * 
 * 
 * Mixins : 
 * Use Case : when having multiple classes share some functions in between 
 * \such as Bird, Duck, Human, Animal  they all share some features of ( canWalk, canSwim, canFly, canDance, ..etc)
 * mixin canFly{void fly () { print('I can fly'); }}
 * mixin canSwim{void swim () { print('I can swim'); }}
 * mixin canWalk{void walk () { print('I can walk'); }}
 * 
 * Now, we can add these features to the classes without the need to do inheritance. 
 * : Also, U can use mixins as a simulator to the multiple inheritance in other languages. 
 * Moreover, If you changed the mixin, you will change all other classes that use it without the 
 * need to update all classes. 
 * 
 * How to use Mixins ? 
 * class Duck with canFly, canSwim{}...
 * Duck duck = Duck(); 
 * duck.fly(); 
 * duck.swim(); 
 * 
 * 
 * 
 *  **** PrePackaged Animations *** 
 * GO to flutter packages, search for animate.. yOU will find alot of packages. 
 * one of them : animated_text_kit 
 * 
 * 
 */


/**
 * FireBase : allows us to manage data storage on the Cloud. 
 * First ; Head to theri website and create a new project  ( Go to Console)
 * Second : add firestore to your app ( android, ios, ..etc)
 * Third : Add firebase packages to your project 
 * https://github.com/FirebaseExtended/flutterfire/blob/master/README.md
 * install : firebase-core, firebase_auth, cloud-firestore packages.  
 *  
 * 
 * import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Fourth : Use the classes of firebase 
Fifth : Dont forget to enable the features that you will use from firebase/build/authencation 
 * 
 */

/***
 *  modal_progress_hud  package is used to load a spinner.  
 * 
 * 
 * 
 * 
 */




/// QuickFix : https://stackoverflow.com/questions/46402772/failed-to-install-android-sdk-java-lang-noclassdeffounderror-javax-xml-bind-a
/// Install the required missing components. 
/// https://firebase.flutter.dev/docs/overview#initializing-flutterfire  
