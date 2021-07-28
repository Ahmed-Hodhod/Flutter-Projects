import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'QuizBrain.dart';

// By: Ahmed Hodhod ( Training on Flutter )

QuizBrain quiz = QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> iconList = [];
  int score = 0;

  void checkCorrect(bool answer) {
    setState(() {
      if (quiz.getAnswer() == answer) {
        iconList.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
        score++;
      } else {
        iconList.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      if (quiz.isFinished()) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "Score ",
          desc: "You got $score right!",
          buttons: [
            DialogButton(
              child: Text(
                "Restart",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  quiz.reset();
                });

                Navigator.pop(context);
              },
              width: 120,
            )
          ],
        ).show();
      }
      quiz.goNext();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkCorrect(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkCorrect(false);
              },
            ),
          ),
        ),
        Row(
          children: iconList,
        ),
      ],
    );
  }
}


// Suggestion : You can take qeustions & answers externally from the user. 

/// Notes taken while learning ( to help my future self to remember FLutter features quickly)
/**
 * The advantage of using our customized list is that we can now add to the list 
  on the fly by simply using the properties and inner methods of the List class.
 
 *  to create a private property in Class, prefix it with an underscore 
 *  Example : _name. Now you only can access it through a getter
 
   Inheritance  syntax: 
 * class parent {}
 * class derived extends parent {}

 * to use a function from the parent class inside the child class
   super.method();
  this is oftenly used in PolyMorphism 
 
 * to override a method from the parent class, @override is used 
 
 * Once you reached the last question, alert the user with the score 
 * the package is rFlutter_alert (Basic alert)
 
 */ 
