import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'news_provider.dart';
import 'news_detail.dart';

class NewsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NewsProvider>(
        builder: (context, newsProvider, child) {
          if (newsProvider.newsList.isEmpty) {
            newsProvider.fetchNews();
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: newsProvider.newsList.length,
            itemBuilder: (context, index) {
              final news = newsProvider.newsList[index];
              return ListTile(
                leading: news.imageUrl.isNotEmpty
                    ? Image.network(news.imageUrl,
                        width: 100, fit: BoxFit.cover)
                    : null,
                title: Text(news.title),
                subtitle: Text(news.description),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailScreen(news: news),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
