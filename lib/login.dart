import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:puppy_do/signup.dart';

import 'main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
              'Login',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email: ',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password: ',
                ),
              ),
            ),
            Flexible(
              child: Container(
                width: 200,
                margin: const EdgeInsets.only(top: 5, bottom: 2, left: 100, right: 100),
                child: ElevatedButton(
                  onPressed: (){
                    Future<UserCredential> credential = FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                    credential.then((value) {
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      final User user = auth.currentUser!;
                      final uid = user.uid;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage(title: 'Puppy-Do - Select Dog',)),
                      );
                    });
                    credential.catchError((error){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Failed to log in!'),
                            content: Text(error.toString()),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          )
                      );
                    });
                  },
                  child: const Text("Login"),
                ),
              ),
            ),
            Flexible(
              child: Container(
                width: 200,
                margin: const EdgeInsets.only(top: 2, bottom: 2, left: 100, right: 100),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpPage(title: 'Sign Up',)),
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