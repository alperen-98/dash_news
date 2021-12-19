import 'dart:convert';
import 'package:dash_news/models/article.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  Future<List<Article>> getArticles(String url) async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      List<dynamic> articles = data['articles'];

      return articles.map((article) => Article.fromJson(article)).toList();
    } else {
      throw 'Error';
    }
  }
}
