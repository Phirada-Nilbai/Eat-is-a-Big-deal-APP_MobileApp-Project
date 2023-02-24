// ignore_for_file: library_private_types_in_public_api

/* import 'package:flutter/material.dart';
import 'appscreen/home_page.dart';
import 'appscreen/eatraidee_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/eat': (context) => const EatPage(),
        '/calculate': (context) => const CalculatePage(),
      },
    );
  }
}

class CalculatePage extends StatelessWidget {
  const CalculatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'หารค่าอาหาร',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
 */

import 'appscreen/food_recommend.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FoodRecommendApp(),
  ));
}
