import 'package:firebase_auth/firebase_auth.dart';
import 'package:donna/model/UserAuth.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserAuth?  _userFromFirebaseUser(User? user) {
    return user != null ? UserAuth(uid: user.uid): null;
  }

  Future register(String email, String password) async {
      try {
        UserCredential? result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        User? user = result.user;
        return _userFromFirebaseUser(user);
      } catch(e) {
        print(e.toString());
        return null;
      }
  }

  Future login(String email, String password) async {
    try {
      UserCredential? result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }


  Stream<UserAuth?> get user {
    return _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user));
  }
}