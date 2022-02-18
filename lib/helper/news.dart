import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:news/models/article_model.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=1d11357551204fc4a38e6820b21ab253"));
    final newsbody = response.body;
    final jsonData = jsonDecode(newsbody);
    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null && element['content'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              description: element['description'],
              urlToImage: element['urlToImage'],
              url: element['url'],
              content: element['content']);
          news.add(articleModel);
        }
      });
    }
  }
}


class CategoryNewsClass{
  
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=1d11357551204fc4a38e6820b21ab253"));
    final newsbody = response.body;
    final jsonData = jsonDecode(newsbody);
    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null && element['content'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              description: element['description'],
              urlToImage: element['urlToImage'],
              url: element['url'],
              content: element['content']);
          news.add(articleModel);
        }
      });
    }
  }
}


