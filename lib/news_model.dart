class News {
  final String title;
  final String description;
  final String content;
  final String url;
  final String imageUrl;

  News({
    required this.title,
    required this.description,
    required this.content,
    required this.url,
    required this.imageUrl,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      description: json['description'],
      content: json['content'],
      url: json['link'],
      imageUrl: json['image'] ?? '',
    );
  }
}
