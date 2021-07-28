import 'dart:collection';
import 'package:flutter/material.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(text: 'Buy Shay ', isDone: false),
    Task(text: 'Buy Shay ', isDone: false),
    Task(text: 'Buy Shay ', isDone: false),
  ];

  int get taskCount {
    return tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    // To prevent editing from outside
    return UnmodifiableListView(_tasks);
  }

  void addTask(String text) {
    _tasks.add(Task(
      text: text,
    ));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.removeWhere((element) => task == element);
    notifyListeners();
  }
}
