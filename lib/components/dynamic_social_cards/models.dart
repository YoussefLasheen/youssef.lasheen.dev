class StackoverflowCard {
  final int bronze;
  final int silver;
  final int gold;
  final int reputation;
  final String link;
  final String imageURL;
  final String name;

  const StackoverflowCard({
    required this.bronze,
    required this.silver,
    required this.gold,
    required this.reputation,
    required this.link,
    required this.imageURL,
    required this.name,
  });

  factory StackoverflowCard.fromJson(Map<String, dynamic> json) {
    return StackoverflowCard(
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


class GithubCard {
  final String login;
  final String avatarURL;
  final String link;
  final String bio;
  final int noOfFollowers;
  final int noOfFollowing;
  final int noOfRepos;

  const GithubCard({
    required this.avatarURL,
    required this.login,
    required this.link,
    required this.bio,
    required this.noOfFollowers,
    required this.noOfFollowing,
    required this.noOfRepos,
  });

  factory GithubCard.fromJson(Map<String, dynamic> json) {
    return GithubCard(
      login: json['login'],
      avatarURL: json['avatar_url'],
      bio: json['bio'],
      noOfFollowers: json['followers'],
      noOfFollowing: json['following'],
      link: json['url'],
      noOfRepos: json['public_repos'],
    );
  }
}


class CodeforcesCard {
  final String handle;
  final String avatarURL;
  final String rank;
  final int rating;
  final int contribution;
  final int friendOfCount;

  const CodeforcesCard({
    required this.handle,
    required this.avatarURL,
    required this.rank,
    required this.rating,
    required this.contribution,
    required this.friendOfCount,
  });

  factory CodeforcesCard.fromJson(Map<String, dynamic> json) {
    return CodeforcesCard(
        handle: json['result'][0]['handle'],
        avatarURL: json['result'][0]['avatar'],
        rank: json['result'][0]['rank'],
        rating: json['result'][0]['rating'],
        contribution: json['result'][0]['contribution'],
        friendOfCount: json['result'][0]['friendOfCount']);
  }
}


class SpotifyCard {
  final String title;
  final String artist;
  final String imageURL;
  final String link;

  const SpotifyCard({
    required this.artist,
    required this.imageURL,
    required this.title,
    required this.link,
  });

  factory SpotifyCard.fromJson(Map<String, dynamic> json) {
    return SpotifyCard(
        title: json['item']['name'],
        artist: json['item']['artists'][0]['name'],
        imageURL: json['item']['album']['images'][0]['url'],
        link: json['item']['external_urls']['spotify']);
  }
}
