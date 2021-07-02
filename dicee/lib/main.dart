import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 2;
  int rightDiceNum = 5;
  @override
  Widget build(BuildContext context) {
    // Randomize the Dices

    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            //flex: 2,

            child: Padding(
              padding: EdgeInsets.all(12),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    leftDiceNum = Random().nextInt(6) + 1;
                    rightDiceNum = Random().nextInt(6) + 1;
                  });
                },
                child: Image(
                  // String Interpolation
                  image: AssetImage('images/dice$leftDiceNum.png'),
                ),
              ),
            ),
          ),
          Expanded(
            //  flex: 5,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    leftDiceNum = Random().nextInt(6) + 1;
                    rightDiceNum = Random().nextInt(6) + 1;
                  });
                },
                child: Image(
                  image: AssetImage('images/dice$rightDiceNum.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
* Comments ** 
Exapnded widget : in order not to allow the image to pop out 
of the screen ( its borders ) 
* we use it with Row, Column most often.
* flex property to set the ration of Exapnded boxes relatvie to 
each other (initally, it is set to 1 for any newly created Expanded box )
* uncomment flex in the above code to see the result. 

* Note : Use Flutter Outline and Lightbulb options for quick fixes 
* 


* Using Gestures : use BUttons
* Dart is a statically-typed language 
Unlike, JavaScript is dynamic 
* To make dart acts as a dynamic lang, declar the variable but 
Dont assign it. 

var myVar; 

later on . 
myVar = 5; 
myVar = 'fs'; 
The compiler will not complain about that. 

the other way to have a dynamic variable is by using dynamic keyword 
dynamic myVar; 

* you can also explicitly enforce the type of data in a variable
string myVar; 
int Numb; 

* when the state of the widget changes, the build function of the 
widget will be recalled again. 
* yOu must call setState() explicitly to inform the stateful widget 
that there is a change. 

* When you press the button : 
1. In stateless widget, the OnPressed function gets called only 
2. In Stateful widget, the Onpressed funtion gets called  as well as 
the build method again. 

* Rule of thumb: 
whever we have something to change on the screen, 
have something to change like a variable, 
in setState method, change this thing ( e.g. variable)
the build method will be recalled gain. 


* In order to use Random Generator, you need first to import 
 dart:math library 


 */
