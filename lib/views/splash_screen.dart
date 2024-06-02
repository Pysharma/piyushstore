import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/home_controller.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize HomeController if not already done
    if (!Get.isRegistered<HomeController>()) {
      Get.put(HomeController());
    }

    Future.delayed(Duration(seconds: 6), () {
      Get.off(LoginScreen());
    });

    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/splash_screen.json',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
