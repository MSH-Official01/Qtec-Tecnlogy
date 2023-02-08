import 'package:flutter/material.dart';

import 'Searching_Products/View/searching_products.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qtec Products',
      debugShowCheckedModeBanner: false,
      home: SearchingProducts(),
    );
  }
}
