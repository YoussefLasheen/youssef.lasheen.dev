import 'package:flutter/material.dart';

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
        SpotifyBigCard(),
        StackoverflowBigCard(),
        DiscordBigCard(),
        GithubBigCard(),
        CodeforcesBigCard()
      ],
    );
  }
}
