import 'Question.dart';

class QuizBrain {
  int _questionNumber = 0; // private
  List<Question> _questionBank = [
    Question('Is Alex the capital of Egypt ?', false),
    Question('Is your name Ahmed ? ', true),
    Question('Do you like Fruits ? ', true)
  ];

  // Is it Valid to go Next
  void goNext() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  // Return Question Text
  String getQuestion() => _questionBank[_questionNumber].questionText;

  // Return Question Answer
  bool getAnswer() => _questionBank[_questionNumber].answer;

  // Check if finsished
  bool isFinished() {
    if (_questionBank.length - 1 == _questionNumber) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
