import 'package:flutter/material.dart';

import 'package:donna/widgets/textField.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Select/Add Category',
              text: '',
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Command',
              text: '',
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFormField(),
            const SizedBox(height: 24),
            TextFormField(),
          ]),
    );
  }
}
