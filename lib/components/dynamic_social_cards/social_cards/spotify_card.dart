import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:personal_website/components/dynamic_social_cards/api_services.dart';
import 'package:personal_website/components/dynamic_social_cards/shared_components/info_card.dart';
import 'package:url_launcher/url_launcher.dart';

class SpotifyBigCard extends StatefulWidget {
  const SpotifyBigCard({
    Key? key,
  }) : super(key: key);

  @override
  State<SpotifyBigCard> createState() => _SpotifyBigCardState();
}

class _SpotifyBigCardState extends State<SpotifyBigCard> {
  @override
  Widget build(BuildContext context) {
    return InfoCard(
      fetchData: fetchSpotify(),
      onPressed: (snapshot) => launch(snapshot.data!.link),
      onhoverChild: Text(
        'OPEN',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      buildChild: (snapshot) => Row(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                snapshot.data!.imageURL,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        snapshot.data!.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        snapshot.data!.artist,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FaIcon(
                      FontAwesomeIcons.spotify,
                      size: 25,
                      color: Color(0xFF73e2a6),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



