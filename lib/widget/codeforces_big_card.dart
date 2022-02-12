import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:personal_website/widget/onhover_button.dart';
import 'package:url_launcher/url_launcher.dart';

class CodeforcesBigCard extends StatefulWidget {
  const CodeforcesBigCard({
    Key? key,
  }) : super(key: key);

  @override
  State<CodeforcesBigCard> createState() => _CodeforcesBigCardState();
}

class _CodeforcesBigCardState extends State<CodeforcesBigCard> {
  late Future<Song> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return ConstrainedBox(
      constraints: BoxConstraints.expand(height: 125, width: 300),
      child: Card(
        color: isDarkMode ? Color(0xFF1f1e1f) : Color(0xFFeeeeee ),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: OnhoverButton(
          onPressed: (){
            launch('https://codeforces.com/profile/YoussefLasheen');
          },
          button: Text('OPEN',  style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold),),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: FutureBuilder(
              future: futureAlbum,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            snapshot.data!.avatarURL,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    snapshot.data!.handle,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      FaIcon(
                                        Icons.rate_review_rounded,
                                        size: 10,
                                      ),
                                      Text(
                                        ' ${snapshot.data!.rating} (${snapshot.data!.rank})',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      FaIcon(FontAwesomeIcons.handshake, size: 10,),
                                      Text(' ${snapshot.data!.contribution} contribution', style: TextStyle(fontSize: 10),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      FaIcon(FontAwesomeIcons.userFriends, size: 10,),
                                      Text(' ${snapshot.data!.friendOfCount} friends', style: TextStyle(fontSize: 10),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FaIcon(
                                  Icons.bar_chart_rounded,
                                  size: 25,
                                  color: isDarkMode
                                      ? Color(0xFFfdd374)
                                      : Color(0xFF042b1d),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Center(child:  CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}

Future<Song> fetchAlbum() async {
  final response = await http.get(
    Uri.parse('https://codeforces.com/api/user.info?handles=YoussefLasheen'),
  );
  final responseJson = jsonDecode(response.body);

  return Song.fromJson(responseJson);
}

class Song {
  final String handle;
  final String avatarURL;
  final String rank;
  final int rating;
  final int contribution;
  final int friendOfCount;


  const Song({
    required this.handle,
    required this.avatarURL,
    required this.rank,
    required this.rating,
    required this.contribution,
    required this.friendOfCount,


  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      handle: json['result'][0]['handle'],
      avatarURL: json['result'][0]['avatar'],
      rank: json['result'][0]['rank'],
      rating: json['result'][0]['rating'],
      contribution: json['result'][0]['contribution'],
      friendOfCount: json['result'][0]['friendOfCount']

    );
  }
}
