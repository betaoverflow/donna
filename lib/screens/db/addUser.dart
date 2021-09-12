import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:donna/model/UserAuth.dart';

class AddUser extends StatelessWidget {
  final String fullName;
  final String company;
  final int age;

  AddUser(this.fullName, this.company, this.age);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final user = Provider.of<UserAuth?>(context);

    Future<void> addUser() {
        // Call the user's CollectionReference to add a new user
        print(user?.uid);

        return users
            .doc(user?.uid)
            .set({
          'full_name': fullName, // John Doe
          'company': company, // Stokes and Sons
          'age': age // 42
        })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: (user != null) ? addUser : null,
      child: Text(
        "Add User",
      ),
    );
  }
}