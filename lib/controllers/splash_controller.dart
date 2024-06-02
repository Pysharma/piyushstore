import 'package:get/get.dart';
import '../views/login_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToLogin();
  }

  void navigateToLogin() {
    Future.delayed(Duration(seconds: 3), () {
      Get.off(LoginScreen());
    });
  }
}
