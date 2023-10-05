import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: favorit(),
    );
  }
}

class favorit extends StatefulWidget {
  @override
  _favoritState createState() => _favoritState();
}

class _favoritState extends State<favorit> {
  List<RecommendationData> allRecommendations = [
    RecommendationData(
      title: 'YouTube',
      imageUrl: 'https://logo.clearbit.com/youtube.com',
      linkUrl: 'https://www.youtube.com/',
    ),
    RecommendationData(
      title: 'Instagram',
      imageUrl: 'https://logo.clearbit.com/instagram.com',
      linkUrl: 'https://www.instagram.com/',
    ),
    RecommendationData(
      title: 'Twitter (X)',
      imageUrl: 'https://logo.clearbit.com/twitter.com',
      linkUrl: 'https://twitter.com/',
    ),
  ];

  List<RecommendationData> favoriteRecommendations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paporit'),
      ),
      body: Column(
        children: [
          // ListView for Favorite Recommendations
          Expanded(
            child: ListView(
              children: [
                for (var recommendation in favoriteRecommendations)
                  RecommendationCard(
                    recommendation: recommendation,
                    onFavoriteChanged: _handleFavoriteChanged,
                  ),
              ],
            ),
          ),
          Divider(), // Optional: Add a divider between the two lists
          // ListView for Non-Favorite Recommendations
          Expanded(
            child: ListView(
              children: [
                for (var recommendation in allRecommendations)
                  if (!favoriteRecommendations.contains(recommendation))
                    RecommendationCard(
                      recommendation: recommendation,
                      onFavoriteChanged: _handleFavoriteChanged,
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleFavoriteChanged(RecommendationData recommendation, bool isFavorite) {
    setState(() {
      if (isFavorite && !favoriteRecommendations.contains(recommendation)) {
        favoriteRecommendations.add(recommendation);
      } else if (!isFavorite && favoriteRecommendations.contains(recommendation)) {
        favoriteRecommendations.remove(recommendation);
      }
    });
  }
}

class RecommendationCard extends StatefulWidget {
  final RecommendationData recommendation;
  final Function(RecommendationData, bool) onFavoriteChanged;

  RecommendationCard({
    required this.recommendation,
    required this.onFavoriteChanged,
  });

  @override
  _RecommendationCardState createState() => _RecommendationCardState();
}

class _RecommendationCardState extends State<RecommendationCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Image.network(
            widget.recommendation.imageUrl,
            height: 200,
            width: 200,
            fit: BoxFit.none,
          ),
          ListTile(
            title: Text(widget.recommendation.title),
            subtitle: Text('Tap for details'),
            trailing: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                  widget.onFavoriteChanged(widget.recommendation, isFavorite);
                });
              },
            ),
            onTap: () {
              _launchURL(widget.recommendation.linkUrl);
            },
          ),
        ],
      ),
    );
  }
}


class RecommendationData {
  final String title;
  final String imageUrl;
  final String linkUrl;

  RecommendationData({
    required this.title,
    required this.imageUrl,
    required this.linkUrl,
  });
}

Future<void> _launchURL(String url) async {
  try {
    await canLaunch(url)
        ? await launch(url)
        : throw 'Could not launch $url';
  } catch (e) {
    print('Error launching URL: $e');
  }
}
