import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_website/components/basic_info/basic_info.dart';
import 'package:personal_website/components/dynamic_social_cards/dynamic_social_cards.dart';
import 'package:personal_website/components/small_info_cards/shared_components/profile_info_card.dart';
import 'package:personal_website/components/basic_info/components/profile_widget.dart';

import 'components/small_info_cards/small_info_cards.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Material(
      child: Center(
        child: SingleChildScrollView(
          primary: true,
          physics: BouncingScrollPhysics(),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(width: 600, height: isLandscape?800:1200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 24),
                  BasicInfo(),
                  const SizedBox(height: 15),
                  SmallInfoCards(),
                  const SizedBox(height: 35),
                  DynamicSocialCards()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
