import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: MyApp(),
      ),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // where we define our new functions to use inside the widget
  void playNote(int noteNumber) {
    final player = AudioCache();
    player.play('note$noteNumber.wav');
  }

  // BuildKey
  Expanded buildKey(int noteNum, Color color) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.black,
          backgroundColor: color,
          //minimumSize: Size(double.infinity, 110),
        ),
        onPressed: () {
          playNote(noteNum);
        },
        child: Text(
          '',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildKey(1, Colors.black12),
          buildKey(2, Colors.yellow.shade200),
          buildKey(3, Colors.red.shade200),
          buildKey(4, Colors.greenAccent.shade200),
          buildKey(5, Colors.cyan.shade200),
          buildKey(6, Colors.blue.shade200),
          buildKey(7, Colors.brown.shade200),
        ],
      ),
    );
  }
}

/*
*Dealing With (Flutter/Dart) Packages
pub.dartlang.org/flutter  to view all the packages exist for flutter 
- Once you choose a package, go to the installation page and follow the instructions.  


here we are gonna use a package to play audios called audioplayers 

* Pass Parameters by name  ( could be helpful when your function 
has a lot of params )
  void func( {String param1, ... , int Number} ) {.. }
  
  in the call: 
  func(Number: 5, param5 : 'ahmed' , .. )


* You need 7 Expanded widgets to fill up the screen, 
use a function to return this expanded widget for you 



* Single Arrow Functions ( Fat Arrow funcs) in Dart is used when the funciton body is ony a single line of code 
  void main() => runApp(myAPP()); 

Equivalent to : 
  void main (){
    runApp(myAPP()); 
  }

=> Fat Arrow 
-> Slim Arrow 

int calc() => 5+ 2; 



A large collections of free sounds  here : https://freesound.org/
 */
