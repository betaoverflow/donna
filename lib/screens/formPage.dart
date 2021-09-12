import 'package:donna/services/db.dart';
import 'package:donna/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:donna/widgets/button.dart';
import 'package:donna/widgets/textField.dart';
import 'package:provider/provider.dart';
import 'package:donna/model/UserAuth.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserAuth?>(context);

    FireStoreService firestore = FireStoreService(user: user);

    return Scaffold(
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
                    child: Text(
                      'Feeder',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(250.0, 30.0, 0.0, 0.0),
                    child: Text(
                      '.',
                      style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  )
                ],
              ),
            ),
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
            const SizedBox(height: 24),
            Text(
              'Category',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropDown(),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () async {
                await firestore.updateCommands(
                    "food_and_drinks", "Pasta", "I need pasta");
              },
              child: Container(
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          'SUBMIT',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  )),
            ),
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
