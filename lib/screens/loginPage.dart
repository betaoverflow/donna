import 'package:donna/screens/signupPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:donna/services/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 24),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: 'EMAIL',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  // hintText: 'EMAIL',
                  // hintStyle: ,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green))),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: 'PASSWORD ',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green))),
              obscureText: true,
            ),
            const SizedBox(height: 48),
            ElevatedButton(
                onPressed: () async {
                  dynamic res = await _auth.login(emailController.text, passwordController.text);
                  Navigator.pop(context);
                  },
                child: Text("login")),
            const SizedBox(height: 12),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SignupPage()));
                },
                child: Text("create an account"))
          ]),
    );
  }
}
