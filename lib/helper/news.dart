import 'dart:convert';

import '../models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=01225cf14dda47239c7192a2c3d7c423";

  Future<void> getNews() async{
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((current){
       if (current['urlToImage'] != null && current['description'] != null) {
         ArticleModel articleModel = ArticleModel(
           author: current['author'],
           title: current['title'],
           description: current['description'],
           url: current['url'],
           urlToImage: current['urlToImage'],
           publishedAt: DateTime.parse(current['publishedAt']),
         );

         news.add(articleModel);
       }
      });
    }
  }
}