import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'page/profile_page.dart';
import 'utils/user_preferences.dart';


Future main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return ThemeProvider(
      initTheme: user.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Builder(
        builder: (context) => MaterialApp(
          home: ProfilePage(),
        ),
      ),
    );
  }
}
