import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileInfoCard extends StatelessWidget {
  final String text;
  final IconData iconData;

  const ProfileInfoCard({
    Key? key, required this.text, required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1,
        child: Card(
          elevation: 12,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                iconData
              ),
              Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 12),)
            ],
          ),
        ),
      ),
    );
  }
}
