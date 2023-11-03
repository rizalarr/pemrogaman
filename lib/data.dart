class data {
  final String title;
  final String imageUrl;
  final String linkUrl;
  bool isFavorite;

  data({
    required this.title,
    required this.imageUrl,
    required this.linkUrl,
    this.isFavorite = false,
  });
}

var SocialMediaList = [
  data(
    title: 'YouTube',
    imageUrl: 'https://logo.clearbit.com/youtube.com',
    linkUrl: 'https://www.youtube.com/',
  ),
  data(
    title: 'Instagram',
    imageUrl: 'https://logo.clearbit.com/instagram.com',
    linkUrl: 'https://www.instagram.com/',
  ),
  data(
    title: 'Twitter (X)',
    imageUrl: 'https://logo.clearbit.com/twitter.com',
    linkUrl: 'https://twitter.com/',
  ),
  data(
    title: 'Tiktok',
    imageUrl: 'https://logo.clearbit.com/tiktok.com',
    linkUrl: 'https://tiktok.com/',
  ),
  data(
    title: 'Spotify',
    imageUrl: 'https://logo.clearbit.com/spotify.com',
    linkUrl: 'https://spotify.com/',
  ),
];
