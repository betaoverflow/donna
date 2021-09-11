import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:donna/home.dart';
import 'package:donna/screens/onboardingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:donna/themes.dart';
import 'package:donna/utils/userPreferences.dart';
import 'package:firebase_core/firebase_core.dart';

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
        // if (snapshot.hasError) {
        //   return SomethingWentWrong();
        // }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return ThemeProvider(
            initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
            child: Builder(
              builder: (context) => MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeProvider.of(context),
                title: title,
                home: Onboarding(),
              ),
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        // return Loading();
        return Text("loading");
      },
    );
  }

}
