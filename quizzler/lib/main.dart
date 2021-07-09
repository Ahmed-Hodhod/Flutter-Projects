import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'QuizBrain.dart';

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
  List<Icon> iconList = []; // an empty list of widgets, initially
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

  // List<String> questions = [
  //   'Is Alex the capital of Egypt ?',
  //   'Is your name Ahmed ? ',
  //   'Do you like Fruits ? '
  // ];
  // List<bool> answers = [
  //   false,
  //   true,
  //   true,
  // ];
  // Moved to Quiz brain
  // List<Question> questionBank = [
  //   Question('Is Alex the capital of Egypt ?', false),
  //   Question('Is your name Ahmed ? ', true),
  //   Question('Do you like Fruits ? ', true)
  // ];

  // int questionNumber = 0; Moved inside QuiZBRAIN

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
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
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
                // the user picked false
                checkCorrect(false);
              },
            ),
          ),
        ),
        //rOW is added
        Row(
          children: iconList,
        ),
      ],
    );
  }
}

/**
 * The advantage of using our customized list is that can now add to the list 
 * on the fly by simply using the properties and inner methods of the List class
 *   BY USING stateful widgets + .List we can add more widgets to the list on the fly 
 * when having the proper situation. 
 * 
 * 
 * TODO : https://exercism.io/my/tracks/dart  to test your knowledge of programming langaugage 
 * 
 * U can create a question class to have the list and a set of MCQs 
 * create your class and import it into the main file 
 * 
 *  to create a private property in Class, prefix it with an underscore 
 *  Example : _name, now you only can access it through a getter function 
 * 
 * quey : what to write inside setState () ? add everything that change from state
 * to antoher (in other words, that will affect the state(something on the screen))
 * 
 * 
 * Inheritance : 
 * class parent {}
 * class derived extends parent {}
 * 
 * 
 * to use a function from the parent class
 *  ,  super.method();
 * this is oftenly used in PolyMorphism 
 * 
 * to override a method from the parent class, @override is used 
 * 
 * Once you reached the last question, alert the user with the score 
 * the package is rFlutter_alert (Basic alert)
 * 
 * you can use this keyword 
 * Question(this.questionText, this.answer );  to set these  2 props directly
 */ 
