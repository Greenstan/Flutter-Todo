import 'package:flutter/material.dart';
import '../models/task.dart';
import 'dropDown.dart';

class AddTask extends StatelessWidget {
  final List<List<Object>> lifeAreas;

  String controlDrop;


  final Function addNewTask;

  final control = TextEditingController();

  AddTask(this.lifeAreas, this.addNewTask, {Key key}) : super(key: key);

  void addTask() {
    addNewTask(control.text, controlDrop);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: "Task"),
            controller: control,
            onSubmitted: (_) {
              addTask();
            },
          ),
          // Dropdown(controlDrop, lifeAreas),
          FlatButton(
            onPressed: addTask,
            child: Text("Add"),
          ),
        
        ],
      ),
    );
  }
}
