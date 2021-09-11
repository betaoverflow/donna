import 'package:donna/screens/signupPage.dart';
import 'package:donna/widgets/textField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'email',
              text: '',
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'password',
              text: '',
              onChanged: (name) {},
            ),
            const SizedBox(height: 48),
            ElevatedButton(onPressed: () async {
              try {
                UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: "",
                    password: "SuperSecretPassword!"
                );
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  print('No user found for that email.');
                } else if (e.code == 'wrong-password') {
                  print('Wrong password provided for that user.');
                }
              }
            }, child: Text("login")),
            const SizedBox(height: 12),
            TextButton(onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SignupPage()));
            }, child: Text("create an account"))
          ]),
    );
  }
}