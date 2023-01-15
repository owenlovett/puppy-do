import 'package:flutter/material.dart';

class AddDogPage extends StatefulWidget {
  const AddDogPage({super.key, required this.title});

  final String title;

  @override
  State<AddDogPage> createState() => _AddDogState();
}

class _AddDogState extends State<AddDogPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
              child: const TextField(
                obscureText: false,
                decoration: InputDecoration(
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
                    child: const TextField(
                      obscureText: false,
                      decoration: InputDecoration(
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
                    child: const TextField(
                      obscureText: false,
                      decoration: InputDecoration(
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
        onPressed: _incrementCounter,
        tooltip: 'Add Dog Profile',
        child: const Icon(Icons.done),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}