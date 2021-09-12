import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:donna/screens/db/addUser.dart';
import 'package:donna/screens/onboardingPage.dart';
import 'package:donna/screens/wrapper.dart';
import 'package:donna/utils/userPreferences.dart';
import 'package:flutter/material.dart';
import 'package:donna/themes.dart';

class BasicLayout extends StatelessWidget {
  const BasicLayout({Key? key}) : super(key: key);
  static final String title = 'User Profile';

  final user = UserPreferences.myUser;
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeProvider.of(context),
          title: title,
          home: Wrapper(),
        ),
      ),
    );
  }
}
