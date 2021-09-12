import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> updateCommands(String title, String content) async {
    var custom;

    await users.doc(user?.uid).get().then(
        (snapshot) {
          custom = snapshot.get("commands");

          // print(custom["personalized"]);
          if(custom["personalized"] == null) {
            custom["personalized"] = [{"title": title, "content": content}];
            // print(custom["personalized"]);
          } else {
            custom["personalized"].add({"title": title, "content": content});
          }
        }
    );

    // print(custom);

    return users
        .doc(user?.uid)
        .update({"commands": custom})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

}