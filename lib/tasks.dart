import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key, required this.title});

  final String title;

  @override
  State<TasksPage> createState() => _TasksState();
}

class _TasksState extends State<TasksPage> {
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
              'This is the tasks page.',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
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