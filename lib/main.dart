import 'package:flutter/material.dart';
import 'package:plants_ui_challenge/products_page/product_page.dart';
import 'package:plants_ui_challenge/styles/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Plants UI Challenge',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const ProductPage(),
      );
}
