import 'package:flutter/material.dart';
import 'package:todoey/models/task_data.dart';

import 'package:todoey/widgets/task_list.dart';
import 'package:provider/provider.dart';

class AddTask extends StatefulWidget {
  //AddTask(this.addTaskCallback);
  //final Function addTaskCallback;

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String taskText = '';
  bool start = true;

  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextField(
                cursorColor: Colors.blueGrey,
                autofocus: true,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
                onChanged: (value) {
                  taskText = value;
                },
                controller: _controller,
              ),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                  onPressed: () {
                    _controller.clear();
                    Navigator.pop(context);
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(taskText);
                  },
                  padding: EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 40,
                  ),
                  color: Colors.lightBlueAccent,
                  textColor: Colors.white,
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
