import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_website/widget/profile_widget.dart';

class DiscordBigCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return ConstrainedBox(
      constraints: BoxConstraints.expand(height: 125, width: 300),
      child: Card(
        color: isDarkMode ? Color(0xFF1f1e1f) : Color(0xFF6d88db),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    'https://cdn.discordapp.com/avatars/467040212866826240/31a5d915666187129d7c7c6dd177070a.webp?size=100',
                  ),
                ),
              ),
              SizedBox(
                      width: 15,
                    ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectableText(
                      'YoussefLasheen',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SelectableText(
                      '#45416',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FaIcon(
                    FontAwesomeIcons.discord,
                    size: 25,
                    color: isDarkMode
                                    ? Color(0xFF6d88db)
                                    : Color(0xFF1f1e1f),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
