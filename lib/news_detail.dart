import 'package:flutter/material.dart';
import 'news_model.dart';

class NewsDetailScreen extends StatelessWidget {
  final News news;

  NewsDetailScreen({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (news.imageUrl.isNotEmpty) Image.network(news.imageUrl),
            SizedBox(height: 16.0),
            Text(
              news.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(news.description),
            SizedBox(height: 16.0),
            Text(news.content),
          ],
        ),
      ),
    );
  }
}
