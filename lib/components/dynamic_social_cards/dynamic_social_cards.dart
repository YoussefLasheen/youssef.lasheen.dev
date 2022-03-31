import 'package:flutter/material.dart';
import 'package:personal_website/components/dynamic_social_cards/social_cards/resume_card.dart';

import 'social_cards/codeforces_card.dart';
import 'social_cards/discord_card.dart';
import 'social_cards/github_card.dart';
import 'social_cards/spotify_card.dart';
import 'social_cards/stackoverflow_card.dart';

class DynamicSocialCards extends StatelessWidget {
  const DynamicSocialCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      children: [
        const SpotifyBigCard(),
        const StackoverflowBigCard(),
        DiscordBigCard(),
        GithubBigCard(),
        CodeforcesBigCard(),
        ResumeCard()
      ],
    );
  }
}
