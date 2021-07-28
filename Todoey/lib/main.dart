import 'package:flutter/material.dart';
import 'package:todoey/Screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

// By : Ahmed Hodhod  @2021 ( Training on Flutter )
void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => TaskData(),
    child: MaterialApp(
      color: Colors.blueAccent,
      home: TasksScreen(),
    ),
  ));
}

/// MVC ( model view controller ) design pattern
/// Design patterns vs State managament methods
///
/// Provider package is very recommended state management method
///
///
///
/// Imagine you have a shared data in Level 1, that you want to use across Level  3
/// in the ordinary way, you will need to have this data in the root ( level 1) and pass it
/// over to  level 2 and then to level 3  to be used
///
/// Provider package is very good at managing this data that will be shared across
/// hierarchical levels of the app. You just need to define it to the root level with
/// the data to be shared and then use it in any subsequent level as you like.
///
///
///
