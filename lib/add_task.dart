import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class AddTaskPage extends StatefulWidget {
  AddTaskPage({super.key, required this.title, this.dogKey});

  var dogKey;
  final String title;

  @override
  State<AddTaskPage> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTaskPage> {

  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Add Task Name",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter name: ',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          String taskname = nameController.text;
          FirebaseAuth.instance
              .authStateChanges()
              .listen((User? user) {
            if (user != null) {
              String uid = user.uid;
              String dog = "${widget.dogKey}";
              FirebaseDatabase.instance.ref().child("users/$uid/$dog" + "/tasks/task-$taskname").set({
                "task name" : nameController.text,
                "marked" : "0"
              }
              ).then((value) {
                print("Success");
                Navigator.pop(context);
              }).catchError((error){
                print("Failed:" + error.toString());
              });
            }
          });
        },
        tooltip: 'Add Dog Profile',
        child: const Icon(Icons.done),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}