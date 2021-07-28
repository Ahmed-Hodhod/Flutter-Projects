import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
              taskData.tasks[index].text, taskData.tasks[index].isDone, () {
            // setState(() {
            //   widget.tasks[index].toggleDone();
            // });
            taskData.updateTask(taskData.tasks[index]);
          }, () {
            taskData.deleteTask(taskData.tasks[index]);
          });
        },
        itemCount: taskData.tasks.length,
      );
    });
  }
}

// Good Approach: to have only one stateful widget and pass the callback for all 
// other stateless widgets from inside this stateful one. 



// Notice How we used Consumer class here, just wrap the direct parent with Consumer 