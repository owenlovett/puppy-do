import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  TasksPage({super.key, required this.title, this.dogDetails});

  final String title;

  var dogDetails;

  @override
  State<TasksPage> createState() => _TasksState();
}

class _TasksState extends State<TasksPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dogDetails.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "${widget.dogDetails.name}",
            ),
          ],
        ),
      ),
    );
  }
}