import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_api_practice/model/news_model.dart';

class NewsScreenControler with ChangeNotifier {
  List<Article> articlelist = [];

  Future<void> getarticle() async {
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=41f5562ab4a641069301792a794fa8a9");
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Newsmodel modelobj = newsmodelFromJson(response.body);
        articlelist = modelobj.articlelist ?? [];
      }
    } catch (e) {}
  }
}
