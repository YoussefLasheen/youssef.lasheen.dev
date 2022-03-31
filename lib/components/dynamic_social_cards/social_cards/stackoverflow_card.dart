import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_website/components/dynamic_social_cards/api_services.dart';

import 'package:personal_website/components/dynamic_social_cards/shared_components/info_card.dart';
import 'package:url_launcher/url_launcher.dart';

class StackoverflowBigCard extends StatefulWidget {
  const StackoverflowBigCard({
    Key? key,
  }) : super(key: key);

  @override
  State<StackoverflowBigCard> createState() => _StackoverflowBigCardState();
}

class _StackoverflowBigCardState extends State<StackoverflowBigCard> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return InfoCard(
        fetchData: fetchStackoverflow(),
        onPressed: (_) =>
            launch('https://stackoverflow.com/users/10240634/youssef-lasheen'),
        onhoverChild: Text(
          'OPEN',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        buildChild: (snapshot) => Row(
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
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: [
                                const FaIcon(
                                  Icons.circle,
                                  size: 10,
                                  color: Color(0xFFffcb38),
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
                                  color: Color(0xFFc0c0c0),
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
                                  color: Color(0xFFd0986b),
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
            ));
  }
}




