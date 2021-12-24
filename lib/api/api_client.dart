import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zeenews/modal/modal.dart';

class ApiClient {
  final _url = 'https://jsonkeeper.com/b/0Y0J';

  ApiClient();

  Future<ArticleModal> fetchArticles() async {
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode != 200) {
      throw Exception('error getting article');
    }
    final json = jsonDecode(response.body);
    return ArticleModal.fromJson(json);
  }

  Future<DetailModal> fetchDetail(String _url) async {
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode != 200) {
      throw Exception('error getting detail');
    }
    final json = jsonDecode(response.body);
    return DetailModal.fromJson(json);
  }
}
