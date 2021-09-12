import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:donna/model/UserAuth.dart';

class FireStoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  UserAuth? user;

  FireStoreService({required this.user});

  Future<void> addUser(String nickName, String age) {
    // Call the user's CollectionReference to add a new user
    print(user?.uid);

    return users
        .doc(user?.uid)
        .set({
      'nick_name': nickName, // John Doe
      'age': age, // 42
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }


  Future<void> addUsers(String category, String title, String text) async {
    DocumentSnapshot snapshot = await users.doc(user?.uid).get();
    return users
        .doc(user?.uid)
        .update()
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

}