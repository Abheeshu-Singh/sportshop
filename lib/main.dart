import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_shop/models/sport_shop.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SportShop(),
      builder: (context, child) => const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
