import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class AddDogPage extends StatefulWidget {
  const AddDogPage({super.key, required this.title});

  final String title;

  @override
  State<AddDogPage> createState() => _AddDogState();
}

class _AddDogState extends State<AddDogPage> {

  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var weightController = TextEditingController();

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
              'Enter Dog Information',
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
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter age: ',
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter weight: ',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          String dogname = nameController.text;
          FirebaseDatabase.instance.ref().child("dogs/dog-$dogname").set({
            "name" : nameController.text,
            "age" : ageController.text,
            "weight" : weightController.text,
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}