import 'package:zeenews/api/api_client.dart';
import 'package:zeenews/modal/modal.dart';

class ApiRepository {
  final apiClient = ApiClient();

  ApiRepository();

  Future<ArticleModal> fetchArticles() async {
    return await apiClient.fetchArticles();
  }

  Future<DetailModal> fetchDetail(String url) async {
    return await apiClient.fetchDetail(url);
  }
}
