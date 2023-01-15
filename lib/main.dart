import 'package:flutter/material.dart';
import 'add_dog.dart';
import 'dog.dart';
import 'tasks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Puppy-Do - Select Dog'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Dog> dogs = <Dog>[];

  _MyHomePageState(){
    Dog millie = Dog("Millie", "0", "10");
    Dog cricket = Dog("Cricket", "16", "30");

    dogs = [millie, cricket];
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
            const Image(
              image: NetworkImage('https://cdn.pixabay.com/photo/2016/04/07/18/57/silhouette-1314467_960_720.png'),
              width: 100,
              height: 100,
              color: Colors.green,
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: dogs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 2, bottom: 2, left: 100, right: 100),
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TasksPage(title: 'Tasks', dogDetails: dogs[index],)),
                        );
                      },
                      child: Text(dogs[index].name),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddDogPage(title: 'Add Dog Profile')),
          );
        },
        tooltip: 'Add Dog Profile',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
