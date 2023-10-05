import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class rekomendasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommendations'),
      ),
      body: ListView(
        children: [
          RecommendationCard(
            title: 'YouTube',
            imageUrl: 'https://logo.clearbit.com/youtube.com',
            linkUrl: 'https://www.youtube.com/',
          ),
          RecommendationCard(
            title: 'Instagram',
            imageUrl: 'https://logo.clearbit.com/instagram.com',
            linkUrl: 'https://www.instagram.com/',
          ),
          RecommendationCard(
            title: 'Twitter (X)',
            imageUrl: 'https://logo.clearbit.com/twitter.com',
            linkUrl: 'https://twitter.com/',
          ),
          // Add more RecommendationCard widgets as needed
        ],
      ),
    );
  }
}

class MyCard extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String linkUrl;

  MyCard({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.linkUrl,
  });

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.network(
            widget.imageUrl,
            height: 200,
            width: 200,
            fit: BoxFit.none,
          ),
          Text(
            widget.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          //Text(widget.description),
          IconButton(
            icon:
                isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
            onPressed: toggleFavorite,
          ),
        ],
      ),
    );
  }
}

class RecommendationCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String linkUrl;

  RecommendationCard({
    required this.title,
    required this.imageUrl,
    required this.linkUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Image.network(
            imageUrl,
            height: 200,
            width: 200,
            fit: BoxFit.none,
          ),
          ListTile(
            title: Text(title),
            subtitle: Text('Tap for details'),
            onTap: () {
              _launchURL(linkUrl); 
            },
          ),
        ],
      ),
    );
  }
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