import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:personal_website/components/dynamic_social_cards/models.dart';

Future<StackoverflowCard> fetchStackoverflow() async {
  final response = await http.get(
    Uri.parse(
        'https://api.stackexchange.com/2.3/users/10240634?order=desc&sort=reputation&site=stackoverflow'),
  );
  final responseJson = jsonDecode(response.body);

  return StackoverflowCard.fromJson(responseJson);
}

Future<GithubCard> fetchGithub() async {
  final response = await http.get(
    Uri.parse('https://api.github.com/users/YoussefLasheen'),
  );
  final responseJson = jsonDecode(response.body);

  return GithubCard.fromJson(responseJson);
}

Future<CodeforcesCard> fetchCodeforces() async {
  final response = await http.get(
    Uri.parse('https://codeforces.com/api/user.info?handles=YoussefLasheen'),
  );
  final responseJson = jsonDecode(response.body);

  return CodeforcesCard.fromJson(responseJson);
}

Future<SpotifyCard> fetchSpotify() async {

  Future<String> getAccessToken() async {
    var map = <String, dynamic>{};
    map['grant_type'] = 'refresh_token';
    map['refresh_token'] = dotenv.env['SPOTIFY_REFRESH_TOKEN'];
    final response =
        await http.post(Uri.parse('https://accounts.spotify.com/api/token'),
            headers: <String, String>{
              'Authorization':
                  'Basic ' + base64.encode('${dotenv.env['SPOTIFY_CLIENT_ID']}:${dotenv.env['SPOTIFY_CLIENT_SECRET']}'.codeUnits),
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

  return SpotifyCard.fromJson(responseJson);
}


Future<bool> fetchDiscord() async {
  return true;
}