import 'dart:convert';

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
  const String clientId = '5dc8e9d18afd404ba022c996c423b351';
  const String clientSecret = '75df0d24579142a9a82f4b20713e8e1d';
  const String refreshToken =
      'AQBPwd1VgF_t4cubLz7vKLmrHBS72AoB9fRsStcWbKnA2djueI_tFdlx7S1ZIK-76jIupz3rBZwbp6vRmyA50mUhgB_WlfXeIyZaFdyfpY4_gqqFQTMb0ZepD2GKj0Pjvbk';

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

  return SpotifyCard.fromJson(responseJson);
}


Future<bool> fetchDiscord() async {
  return true;
}