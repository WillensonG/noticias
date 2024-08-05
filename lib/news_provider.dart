import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'news_model.dart';

class NewsProvider with ChangeNotifier {
  List<News> _newsList = [];

  List<News> get newsList => _newsList;

  Future<void> fetchNews() async {
    final url = 'https://adamix.net/minerd/def/noticias.php';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data); // Imprime la respuesta de la API

      if (data is List) {
        _newsList = data.map((article) => News.fromJson(article)).toList();
        notifyListeners();
      } else {
        throw Exception('Invalid data format');
      }
    } else {
      throw Exception('Failed to load news');
    }
  }
}
