import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'page/profile_page.dart';


Future main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: ProfilePage(),
    );
  }
}
