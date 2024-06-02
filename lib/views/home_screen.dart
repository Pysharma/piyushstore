import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'favorite_screen.dart';
import 'profile_screen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>(); // Access HomeController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (homeController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: MasonryGridView.count(
              crossAxisCount: 2,
              itemCount: homeController.articles.length,
              itemBuilder: (context, index) {
                var article = homeController.articles[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (article.imageUrl.isNotEmpty)
                        Image.network(article.imageUrl, fit: BoxFit.cover),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          article.title,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: article.isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          homeController.toggleFavorite(article);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Get.to(HomeScreen());
          } else if (index == 1) {
            Get.to(FavoriteScreen());
          } else if (index == 2) {
            Get.to(ProfileScreen());
          }
        },
      ),
    );
  }
}
