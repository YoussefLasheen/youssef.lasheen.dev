import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_website/components/dynamic_social_cards/dynamic_social_cards.dart';
import 'package:personal_website/widget/profile_info_card.dart';
import 'package:personal_website/widget/profile_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Material(
      child: Center(
        child: SingleChildScrollView(
          primary: true,
          physics: BouncingScrollPhysics(),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(width: 600, height: 1000),
              child: Column(
                children: [
                  ProfileWidget(
                    imagePath: 'https://avatars.githubusercontent.com/u/28854622?v=4',
                  ),
                  const SizedBox(height: 24),
                  buildName(),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: const <Widget>[
                          ProfileInfoCard(
                            text: "INTP",
                            iconData: FontAwesomeIcons.iCursor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ProfileInfoCard(
                            text: "Developer",
                            iconData: Icons.developer_mode_rounded,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ProfileInfoCard(
                            text: "Engineering\nStudent",
                            iconData: Icons.engineering_rounded,
                          ),
                        ],
                      ),
                    ),
                  ),
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

  Widget buildName() => Column(
        children: [
          Text(
            'Youssef Lasheen',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            'youssef@lasheen.dev',
            style: TextStyle(color: Colors.grey),
          )
        ],
      );
}
