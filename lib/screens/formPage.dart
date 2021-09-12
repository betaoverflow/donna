import 'package:donna/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:donna/widgets/button.dart';
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
              label: 'Title',
              text: '',
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Content',
              text: '',
              onChanged: (name) {},
            ),
            const SizedBox(height: 50),
            DropDown(),
            const SizedBox(height: 270),
            Center(child: buildUserButton()),
          ]),
    );
  }
}

Widget buildUserButton() => ButtonWidget(
      text: 'Submit',
      onClicked: () {},
    );
