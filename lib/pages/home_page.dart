import 'package:flutter/material.dart';
import 'package:flutter_projet_final/pages/large_card_popular.dart';
import 'package:flutter_projet_final/res/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey2,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'Bienvenue !',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const LargeCardPopular(),
            const SizedBox(height: 10),
            const LargeCardPopular(),
            const SizedBox(height: 10),
            const LargeCardPopular(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
