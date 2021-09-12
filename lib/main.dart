import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:donna/utils/userPreferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:donna/services/auth.dart';
import 'package:donna/screens/basicLayout.dart';

import 'model/UserAuth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'User Profile';
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<UserAuth?>.value(
            value: AuthService().user,
            initialData: null,
            child: BasicLayout(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        // return Loading();
        return Loading();
      },
    );
  }

}


class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
            child: Text("something went wrong")
          )
        )
      )
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                child: Center(
                    child: CircularProgressIndicator()
                )
            )
        )
    );
  }
}