import 'package:flutter/material.dart';

import 'main.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.title});

  final String title;

  @override
  State<SignUpPage> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {

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
              image: NetworkImage('https://cdn-icons-png.flaticon.com/512/194/194279.png'),
              width: 100,
              height: 100,
              color: Colors.green,
            ),
            const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: const TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username: ',
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
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password: ',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              child: Container(
                width: 200,
                margin: const EdgeInsets.only(top: 2, bottom: 2, left: 100, right: 100),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Puppy-Do - Select Dog',)),
                    );
                  },
                  child: const Text("Sign Up"),
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}