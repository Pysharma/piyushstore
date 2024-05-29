import 'package:flutter/material.dart';

import 'home/ui/homepage.dart';

void main() {
  runApp(const MyApp());
}
//https://fakestoreapi.com/products
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}
