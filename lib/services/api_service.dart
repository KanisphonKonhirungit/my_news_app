import 'dart:convert';
import 'package:http/http.dart';
import '../modal/article_model.dart';

class ApiService {
  final endPointUrl = Uri.parse(
      "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=bc46a367b361409393c8cf045fc80c14");

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
