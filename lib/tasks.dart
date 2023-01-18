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

  var tasks = [];

  Future<void> loadData() async {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) async {
      if (user != null) {
        print(user.uid);
        String uid = user.uid;
        String dog = "${widget.dogKey}";
        DatabaseReference ref = FirebaseDatabase.instance.ref("users/$uid/$dog/tasks");
        DatabaseEvent event = await ref.once();
        var snapshot = event.snapshot;
        var tmptasks = [];
        snapshot.children.forEach((child) {
          print(child.key);
          tmptasks.add(child.value);
        });
        tasks = tmptasks;
        setState(() {

        });
      }
    });
  }

  _TasksState(){
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user != null) {
        String uid = user.uid;
        String dog = "${widget.dogKey}";
        loadData();
        FirebaseDatabase.instance.ref().child("users/$uid/$dog").onChildChanged.listen((event) {
          loadData();
        });
        FirebaseDatabase.instance.ref().child("users/$uid/$dog").onChildAdded.listen((event) {
          loadData();
        });
        FirebaseDatabase.instance.ref().child("users/$uid/$dog").onChildRemoved.listen((event) {
          loadData();
        });
      }
    });
  }

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
            const Text(
              'Tasks:',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      FirebaseAuth.instance
                          .authStateChanges()
                          .listen((User? user) {
                        if (user != null) {
                          String uid = user.uid;
                          String dog = "${widget.dogKey}";
                          FirebaseDatabase.instance.ref().child("users/$uid/$dog" + "/tasks/task-${tasks[index]['task name']}").set({
                            "task name" : "${tasks[index]['task name']}",
                            "marked" : "done"
                          }
                          ).then((value) {
                            print("Success");
                          }).catchError((error){
                            print("Failed:" + error.toString());
                          });
                        }
                      });
                      setState(() {

                      });
                    },
                    title: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 2, bottom: 2,),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(right: 50),
                                child: Text('${tasks[index]['task name']}' + ' - ${tasks[index]['marked']}')),
                            Container(
                              child: ElevatedButton(
                                onPressed: (){
                                  FirebaseAuth.instance
                                      .authStateChanges()
                                      .listen((User? user) {
                                    if (user != null) {
                                      String uid = user.uid;
                                      String dog = "${widget.dogKey}";
                                      FirebaseDatabase.instance.ref().child("users/$uid/$dog" + "/tasks/task-${tasks[index]['task name']}").set({
                                        "task name" : "${tasks[index]['task name']}",
                                        "marked" : "not done"
                                      }
                                      ).then((value) {
                                        print("Success");
                                      }).catchError((error){
                                        print("Failed:" + error.toString());
                                      });
                                    }
                                  });
                                  setState(() {

                                  });
                                },
                                child: Text('reset'),
                              ),
                            ),
                          ],
                        ),
                    ),
                  );
                },
              ),
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