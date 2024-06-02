import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../views/login_screen.dart';

class ProfileController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  @override
  void onInit() {
    loadUserDetails();
    super.onInit();
  }

  void loadUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email.value = prefs.getString('email') ?? '';
    password.value = prefs.getString('password') ?? '';
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAll(LoginScreen());
  }
}
