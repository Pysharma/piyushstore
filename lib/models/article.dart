class Article {
  final String title;
  final String url;
  final String imageUrl;
  bool isFavorite;

  Article({
    required this.title,
    required this.url,
    required this.imageUrl,
    this.isFavorite = false,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      url: 'https://en.wikipedia.org/?curid=${json['pageid']}',
      imageUrl: json['thumbnail'] != null ? json['thumbnail']['source'] : '',
    );
  }
}
