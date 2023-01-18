import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

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
          String dog = "${widget.dogKey}";
          var timestamp = DateTime.now().millisecondsSinceEpoch;
          FirebaseDatabase.instance.ref().child("dogs/$dog" + "/tasks/task$timestamp").set({
            "task name" : "task 1",
            "marked" : "0"
          }
          ).then((value) {
            print("Success");
            Navigator.pop(context);
          }).catchError((error){
            print("Failed:" + error.toString());
          });
        },
        tooltip: 'Add Dog Profile',
        child: const Icon(Icons.done),
      ),
    );
  }
}