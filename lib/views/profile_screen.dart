import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                child: Text(
                  profileController.email.value.substring(0, 1).toUpperCase(),
                  style: TextStyle(fontSize: 40),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Email: ${profileController.email.value}',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Password: ${profileController.password.value}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  profileController.logout();
                },
                child: Text('Logout'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
