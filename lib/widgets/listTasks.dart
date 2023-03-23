import '../models/task.dart';
import 'package:flutter/material.dart';

class ListTasks extends StatefulWidget {
  final List<Task> notTasks;

  final List<Task> doneTasks;

  ListTasks(this.doneTasks, this.notTasks, {Key key}) : super(key: key);

  @override
  _ListTasksState createState() => _ListTasksState();
}

class _ListTasksState extends State<ListTasks> {
  void completeTask(Task task, bool value) {
    setState(() {
      task.isDone = value;
      if (task.isDone == true) {
        this.widget.notTasks.remove(task);
        this.widget.doneTasks.add(task);
      } else {
        this.widget.doneTasks.remove(task);
        this.widget.notTasks.add(task);
      }
    });
  }

  Card taskwidget(int index, List<Task> tsks) {
    return Card(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Checkbox(
                  value: tsks[index].isDone,
                  onChanged: (bool value) {
                    completeTask(tsks[index], value);
                  }),
              Text(
                tsks[index].name,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      tsks.remove(tsks[index]);
                    });
                  }),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Unfinished",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(bottom: 30),
              height: 250,
              child: ListView.builder(
                itemCount: this.widget.notTasks.length,
                itemBuilder: (ctx, index) {
                  return taskwidget(index, this.widget.notTasks);
                },
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Finished",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                )
              ],
            ),
            Container(
              height: 300,
              child: ListView.builder(
                itemCount: this.widget.doneTasks.length,
                itemBuilder: (ctx, index) {
                  return taskwidget(index, this.widget.doneTasks);
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
