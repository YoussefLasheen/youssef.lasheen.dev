import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:personal_website/widget/info_card.dart';
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
      fetchData: fetchAlbum(),
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

Future<Song> fetchAlbum() async {
  const String clientId = '5dc8e9d18afd404ba022c996c423b351';
  const String clientSecret = '75df0d24579142a9a82f4b20713e8e1d';
  const String refreshToken =
      'AQCH_tS-O7ynws46Jlza3GNGxwbomXWrDTasqv_phA5bPch3_QE3kgL0MHG8W-E0YtTibiJVEuWn4a1-4uw6IWcalvmkYu49q9YOfpRJ_1yyPFWCgnRkfrklm47Hnmf3n_w';

  Future<String> getAccessToken() async {
    var map = <String, dynamic>{};
    map['grant_type'] = 'refresh_token';
    map['refresh_token'] = refreshToken;
    final response =
        await http.post(Uri.parse('https://accounts.spotify.com/api/token'),
            headers: <String, String>{
              'Authorization':
                  'Basic ' + base64.encode('$clientId:$clientSecret'.codeUnits),
              'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: map);
    final responseJson = jsonDecode(response.body);
    return responseJson['access_token'];
  }

  String token = await getAccessToken();

  final response = await http.get(
    Uri.parse('https://api.spotify.com/v1/me/player/currently-playing'),
    headers: {
      'Authorization': 'Bearer ' + token,
    },
  );
  final responseJson = jsonDecode(response.body);

  return Song.fromJson(responseJson);
}

class Song {
  final String title;
  final String artist;
  final String imageURL;
  final String link;

  const Song({
    required this.artist,
    required this.imageURL,
    required this.title,
    required this.link,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
        title: json['item']['name'],
        artist: json['item']['artists'][0]['name'],
        imageURL: json['item']['album']['images'][0]['url'],
        link: json['item']['external_urls']['spotify']);
  }
}
