import 'dart:io';

import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  final String imagePath;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  bool hovering = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 128,
          height: 128,
      child: MouseRegion(
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
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 150),
            child: hovering?buildLogo():buildImage(),
          ),
        ),
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(widget.imagePath);
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.scaleDown,
          width: 128,
          height: 128,
        ),
      ),
    );
  }


  Widget buildLogo() {
    final image = AssetImage('images/youssef.png');

    return Image(
      image: image,
      fit: BoxFit.scaleDown,
      width: 128,
      height: 128,
    );
  }
}