import 'package:get/get.dart';
import '../models/article.dart';

class FavoriteController extends GetxController {
  var favoriteArticles = <Article>[].obs;

  void addFavorite(Article article) {
    favoriteArticles.add(article);
  }

  void removeFavorite(Article article) {
    favoriteArticles.remove(article);
  }
}
