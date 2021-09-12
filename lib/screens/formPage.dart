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
            ElevatedButton(
                onPressed: () async {
                  await firestore.updateCommands("food_and_drinks", "Pasta", "I need pasta");
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
