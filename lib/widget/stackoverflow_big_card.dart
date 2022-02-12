import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class StackoverflowBigCard extends StatefulWidget {
  const StackoverflowBigCard({
    Key? key,
  }) : super(key: key);

  @override
  State<StackoverflowBigCard> createState() => _StackoverflowBigCardState();
}

class _StackoverflowBigCardState extends State<StackoverflowBigCard> {
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
      constraints: const BoxConstraints.expand(height: 125, width: 300),
      child: Card(
        color: isDarkMode ? const Color(0xFF1f1e1f) : const Color(0xFFeeeeee),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
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
                          snapshot.data!.imageURL,
                        ),
                      ),
                    ),
                    const SizedBox(
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
                                  snapshot.data!.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  snapshot.data!.reputation.toString(),
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    const FaIcon(
                                      Icons.circle,
                                      size: 10,
                                      color: Colors.yellowAccent,
                                    ),
                                    const SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      snapshot.data!.gold.toString(),
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const FaIcon(
                                      Icons.circle,
                                      size: 10,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      snapshot.data!.silver.toString(),
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const FaIcon(
                                      Icons.circle,
                                      size: 10,
                                      color: Colors.orange,
                                    ),
                                    const SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      snapshot.data!.bronze.toString(),
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
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
                                FontAwesomeIcons.stackOverflow,
                                size: 25,
                                color: isDarkMode
                                    ? const Color(0xFFfc8136)
                                    : const Color(0xFF042b1d),
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
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}

Future<Song> fetchAlbum() async {
  final response = await http.get(
    Uri.parse(
        'https://api.stackexchange.com/2.3/users/10240634?order=desc&sort=reputation&site=stackoverflow'),
  );
  final responseJson = jsonDecode(response.body);
  print(responseJson);

  return Song.fromJson(responseJson);
}

class Song {
  final int bronze;
  final int silver;
  final int gold;
  final int reputation;
  final String link;
  final String imageURL;
  final String name;

  const Song({
    required this.bronze,
    required this.silver,
    required this.gold,
    required this.reputation,
    required this.link,
    required this.imageURL,
    required this.name,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      bronze: json['items'][0]['badge_counts']['bronze'],
      silver: json['items'][0]['badge_counts']['silver'],
      gold: json['items'][0]['badge_counts']['gold'],
      reputation: json['items'][0]['reputation'],
      link: json['items'][0]['link'],
      imageURL: json['items'][0]['profile_image'],
      name: json['items'][0]['display_name'],
    );
  }
}
