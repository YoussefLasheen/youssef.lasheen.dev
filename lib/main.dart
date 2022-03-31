import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_website/main_screen.dart';

Future main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youssef\'s Links',
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: MainScreen(),
    );
  }
}
