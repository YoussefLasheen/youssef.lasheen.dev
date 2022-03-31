import 'package:flutter/material.dart';

import 'components/profile_widget.dart';

class BasicInfo extends StatelessWidget {
  const BasicInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileWidget(
          imagePath: 'https://avatars.githubusercontent.com/u/28854622?v=4',
        ),
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
}
