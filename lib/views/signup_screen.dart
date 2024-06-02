import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/login_controller.dart';

class SignUpScreen extends StatelessWidget {
  final LoginController loginController = Get.find();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network('https://lottie.host/c9eb6833-bf0a-481e-87ea-f0980e2abff1/uB3ogNaUEd.json',),
              SizedBox(height: 16),
              CupertinoTextField(
                controller: emailController,
                placeholder: 'Email',
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
              ),
              SizedBox(height: 16),
              CupertinoTextField(
                controller: passwordController,
                placeholder: 'Password',
                padding: EdgeInsets.all(16),
                obscureText: true,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  loginController.signUp(emailController.text, passwordController.text);
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
