import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class FavoriteScreen extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>(); // Access HomeController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        centerTitle: true,
      ),
      body: Obx(() {
        var favoriteArticles = homeController.articles.where((article) => article.isFavorite).toList();
        if (favoriteArticles.isEmpty) {
          return Center(child: Text('No favorite articles'));
        } else {
          return ListView.builder(
            itemCount: favoriteArticles.length,
            itemBuilder: (context, index) {
              var article = favoriteArticles[index];
              return Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  leading: article.imageUrl.isNotEmpty
                      ? Image.network(article.imageUrl, fit: BoxFit.cover)
                      : Icon(Icons.image_not_supported),
                  title: Text(article.title),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      homeController.toggleFavorite(article);
                    },
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
