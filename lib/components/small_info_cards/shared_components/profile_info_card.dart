import 'package:flutter/material.dart';
import 'package:foil/foil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileInfoCard extends StatefulWidget {
  final String text;
  final IconData iconData;

  const ProfileInfoCard({
    Key? key, required this.text, required this.iconData,
  }) : super(key: key);

  @override
  State<ProfileInfoCard> createState() => _ProfileInfoCardState();
}

class _ProfileInfoCardState extends State<ProfileInfoCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          hovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          hovering = false;
        });
      },
      child: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Card(
            elevation: 12,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Foil(
              isUnwrapped: !hovering,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    widget.iconData
                  ),
                  Text(widget.text, textAlign: TextAlign.center, style: TextStyle(fontSize: 12),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
