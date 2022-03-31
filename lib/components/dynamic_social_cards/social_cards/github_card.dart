import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:personal_website/components/dynamic_social_cards/api_services.dart';
import 'package:personal_website/components/dynamic_social_cards/shared_components/info_card.dart';
import 'package:url_launcher/url_launcher.dart';

class GithubBigCard extends StatefulWidget {
  const GithubBigCard({
    Key? key,
  }) : super(key: key);

  @override
  State<GithubBigCard> createState() => _GithubBigCardState();
}

class _GithubBigCardState extends State<GithubBigCard> {

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return InfoCard(
      fetchData: fetchGithub(),
      onPressed: (_)=>launch('https://github.com/YoussefLasheen'),
      onhoverChild: Text('OPEN',  style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold),),
      buildChild:(snapshot)=> Row(
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
                              snapshot.data!.login,
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
                                  FontAwesomeIcons.users,
                                  size: 10,
                                ),
                                Text(
                                  ' ${snapshot.data!.noOfFollowers} followers · ${snapshot.data!.noOfFollowing} following',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                FaIcon(Icons.book, size: 10,),
                                Text(' ${snapshot.data!.noOfRepos} repos', style: TextStyle(fontSize: 10),),
                              ],
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FaIcon(
                            FontAwesomeIcons.github,
                            size: 25,
                            color: isDarkMode
                                ? Color(0xFF00863d)
                                : Color(0xFF042b1d),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
    );
  }
}




