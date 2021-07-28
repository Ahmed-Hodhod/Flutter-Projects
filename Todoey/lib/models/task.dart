class Task {
  bool isDone;
  String text;
  Task({this.text = '', this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
