import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/article.dart';

class HomeController extends GetxController {
  var articles = <Article>[].obs;
  var isLoading = true.obs;
  var page = ''.obs;

  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }

  void fetchArticles() async {
    try {
      isLoading(true);
      var url =
          'https://en.wikipedia.org/w/api.php?format=json&action=query&generator=random&grnnamespace=0&prop=pageimages&rvprop=content&grnlimit=25${page.value.isNotEmpty ? '&continue=${page.value}' : ''}';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var articlesJson = data['query']['pages'] as Map<String, dynamic>;
        articles.addAll(articlesJson.values.map((json) => Article.fromJson(json)).toList());
        page.value = data['continue']?['continue'] ?? '';
      }
    } finally {
      isLoading(false);
    }
  }

  void loadMore() {
    fetchArticles();
  }

  void toggleFavorite(Article article) {
    article.isFavorite = !article.isFavorite;
    articles.refresh();
  }

  void removeFavorite(Article article) {
    articles.firstWhere((a) => a.title == article.title).isFavorite = false;
    articles.refresh();
  }
}
