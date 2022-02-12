import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_website/utils/user_preferences.dart';
import 'package:personal_website/model/user.dart';
import 'package:personal_website/widget/appbar_widget.dart';
import 'package:personal_website/widget/discord_big_card.dart';
import 'package:personal_website/widget/github_big_card.dart';
import 'package:personal_website/widget/profile_info_big_card.dart';
import 'package:personal_website/widget/profile_info_card.dart';
import 'package:personal_website/widget/profile_widget.dart';
import 'package:personal_website/widget/spotify_big_card.dart';
import 'package:personal_website/widget/stackoverflow_big_card.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          body: Center(
            child: SingleChildScrollView(
              primary: true,
              physics: BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(width: 600, height: 1000),
                child: Column(
                  children: [
                    ProfileWidget(
                      imagePath: user.imagePath,
                    ),
                    const SizedBox(height: 24),
                    buildName(user),
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
                    Wrap(
                      runSpacing: 10,
                      children: [
                        SpotifyBigCard(),
                        StackoverflowBigCard(),
                        DiscordBigCard(),
                        GithubBigCard()
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );
}
