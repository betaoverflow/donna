import 'package:donna/services/db.dart';
import 'package:donna/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:donna/model/UserAuth.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _content = TextEditingController();

  @override
  void dispose() {
    _title.dispose();
    _content.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserAuth?>(context);

    FireStoreService firestore = FireStoreService(user: user);

    return Scaffold(
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 24),
            TextField(
              controller: _title,
              decoration: InputDecoration(
                  labelText: 'TITLE ',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green))),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _content,
              decoration: InputDecoration(
                  labelText: 'DESCRIPTION ',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green))),
            ),
            const SizedBox(height: 50),
            DropDown(),
            const SizedBox(height: 270),
            ElevatedButton(
                onPressed: () async {
                  await firestore.updateCommands(_title.text, _content.text);
                },
                child: Text("Submit")),
          ]),
    );
  }
}

// Widget buildUserButton() => ButtonWidget(
//       text: 'Submit',
//       onClicked: () {
//
//       },
//     );
