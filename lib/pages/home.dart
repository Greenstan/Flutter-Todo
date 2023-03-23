import 'package:flutter/material.dart';
import '../widgets/listTasks.dart';
import '../models/task.dart';
import '../widgets/addTask.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const lifeAreas = [
    ["Health", Colors.red],
    ["Social", Colors.blue],
    ["Work", Colors.green]
  ];

  final List<Task> notTasks = [];
  final List<Task> doneTasks = [];

  void addNewTask(String txt, String area) {
    if (txt.isEmpty) {
      return;
    }
    final newT = Task(txt, area, false);

    setState(() {
      notTasks.add(newT);
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              Navigator.pushNamed(context, '/menu');

              // If we want to go all the way back to the home page
              // Navigator.pushReplacementNamed(context, routeName)
            },
          )
        ],
      ),
      body: Center(
        child: ListTasks(doneTasks, notTasks),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.all(25),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return AddTask(lifeAreas,addNewTask);
                });
          },
        ),
      ),
    );
  }
}
