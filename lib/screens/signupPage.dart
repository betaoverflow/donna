import 'package:donna/screens/loginPage.dart';
import 'package:donna/widgets/textField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'username',
              text: '',
              onChanged: (name) {},
            ),
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
            ElevatedButton(onPressed: () {}, child: Text("login")),
            const SizedBox(height: 12),
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("already have an account"))
          ]),
    );
  }
}
