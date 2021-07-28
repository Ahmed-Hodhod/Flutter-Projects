import 'package:flutter/material.dart';
import 'dart:math';

/// By : Ahmed Hodhod 2021 (built as a training on Flutter)

enum Dice {
  Rihgt,
  Left,
}
void main() {
  return runApp(
    MaterialApp(
      color: Color(0xFF512D6D),
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dicee App by Ahmed Hodhod'),
          // backgroundColor: Colors.red,
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
  bool _checked = false;
  int leftDiceNum = 2;
  int rightDiceNum = 5;

  void throwDices() {
    if (_checked) {
      leftDiceNum = Random().nextInt(6) + 1;
      rightDiceNum = Random().nextInt(6) + 1;
    }
  }

  void throwOneDice(Dice dice) {
    if (dice == Dice.Left) {
      leftDiceNum = Random().nextInt(6) + 1;
    } else {
      rightDiceNum = Random().nextInt(6) + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Randomize the Dices
    return Column(
      children: [
        ListTile(
          title: Text(
            'Generate both dices per pressing any',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.right,
          ),
          trailing: Switch(
            value: _checked,
            onChanged: (value) {
              setState(() {
                _checked = !_checked;
              });
            },
            activeColor: Color(0xFFF8485E),
          ),
        ),
        Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              //flex: 2,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      (_checked) ? throwDices() : throwOneDice(Dice.Left);
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
                      (_checked) ? throwDices() : throwOneDice(Dice.Rihgt);
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
      ],
    );
  }
}

// Suggested : enable the user to choose whether to change both 
// dices per each press or just the one that was clicked. 

/// comments below is not formal for publication. 
/// They are just notes for my future self to help me remember fast about basic tools. 
/*

  Exapnded widget : in order not to allow the image to pop out 
              of the screen ( its borders ). By default, image takes up all the 
              available space. 
              it takes as much space as available.
* Expaneded is commonly used with Row, Column
* flex property (Expanded):  to set the ratio of Exapnded boxes relatvie to 
each other (initally, it is set to 1 for any newly created Expanded box )
* uncomment flex in the above code to see the result. 

* Tip : Use Flutter Outline and Lightbulb options for quick fixes 

* Using Gestures : use BUttons
* Dart is a statically-typed language 
Unlike, JavaScript is dynamic 
* To make dart acts as a dynamic lang, declar the variable but 
Don't assign it. 
Example: 
(Dynamic variable)
var myVar;  
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
the build method of the stateful widget. 

* Rule of thumb: 
whenever we need something to change on the screen, 
have something to change(such as a local variable) in setState method,
 change it. 
the build method will be recalled gain will all inside content is updated. 
 

* In order to use Random Generator, you need first to import 
 dart:math library 

 */


