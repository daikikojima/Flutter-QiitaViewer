import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:qiita_viewer/model/article.dart';

class QiitaRepository {
  static Future<List<Article>> getArticles() async {
    const url = "https://qiita.com/api/v2/items?page=1&per_page=20";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var _body = json.decode(response.body);
      return (_body as List).map<Article>((json) => Article.fromJson(json)).toList();
    }
  }
}
