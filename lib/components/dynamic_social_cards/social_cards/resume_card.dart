import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_website/components/dynamic_social_cards/api_services.dart';
import 'package:personal_website/components/dynamic_social_cards/shared_components/info_card.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:any_link_preview/any_link_preview.dart';

class ResumeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return InfoCard(
        fetchData: fetchDiscord(),
        onPressed: (_) => launch(
            'https://docs.google.com/document/d/1sMSAUgJeH_iUEKxlrnQVRm6SVUGlupZrh7c7RycLjuw/export?format=pdf'),
        onhoverChild: const Text(
          'DOWNLOAD',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        buildChild: (snapshot) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnyLinkPreview(
                link:
                    "https://docs.google.com/document/d/1sMSAUgJeH_iUEKxlrnQVRm6SVUGlupZrh7c7RycLjuw/edit?usp=sharing",
                displayDirection: uiDirection.uiDirectionHorizontal,
                showMultimedia: true,
                bodyMaxLines: 6,
                bodyTextOverflow: TextOverflow.fade,
                titleStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                bodyStyle: const TextStyle(color: Colors.white, fontSize: 12),
                backgroundColor: Colors.transparent,
                borderRadius: 0,
                removeElevation: true,
              ),
            ));
  }
}
