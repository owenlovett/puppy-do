import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'add_task.dart';

class TasksPage extends StatefulWidget {
  TasksPage({super.key, required this.title, this.dogDetails, this.dogKey});

  final String title;

  var dogDetails;
  var dogKey;

  @override
  State<TasksPage> createState() => _TasksState();
}

class _TasksState extends State<TasksPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dogDetails['name']),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "${widget.dogDetails['name']}",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskPage(title: 'Add Task', dogKey: widget.dogKey,)),
          );
        },
        tooltip: 'Add Dog Profile',
        child: const Icon(Icons.done),
      ),
    );
  }
}