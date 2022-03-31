import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'shared_components/profile_info_card.dart';

class SmallInfoCards extends StatelessWidget {
  const SmallInfoCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}