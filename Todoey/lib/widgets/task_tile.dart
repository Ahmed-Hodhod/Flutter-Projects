import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';

class TaskTile extends StatelessWidget {
  TaskTile(this.taskText, this.isChecked, this.checkboxCallback,
      this.onDoubleClickCallback);
  final String taskText;
  final bool isChecked;
  final Function checkboxCallback;
  final Function onDoubleClickCallback;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        onDoubleClickCallback();
      },
      child: CheckboxListTile(
        value: isChecked,
        onChanged: (value) {
          value = isChecked;
          checkboxCallback();
        },
        activeColor: Colors.lightBlueAccent,
        controlAffinity: ListTileControlAffinity.trailing,
        title: Text(
          taskText,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            fontStyle: isChecked ? FontStyle.italic : FontStyle.normal,
            color: Colors.black,
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}


// Check out the task_tile widget in the course resources. 
// the instructor made a statless widget to setState of a calling stateful widget
// via calling the stateless widget insdie the build function of the stateful widget 
// + passing over the callback ( that contains the setState body) to the stateless 
// widget when calling. 