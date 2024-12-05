import 'package:flutter/material.dart';

import 'Widgets/inListWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ListInWidget(
        imageUrl:
            'https://images.openfoodfacts.org/images/products/500/015/948/4695/front_fr.85.400.jpg',
        title: 'Flutter Demo Home Page',
        nb: '1',
      ),
    );
  }
}
