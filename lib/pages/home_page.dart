import 'package:flutter/material.dart';
import 'package:flutter_projet_final/pages/large_card_popular.dart';
import 'package:flutter_projet_final/res/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.gray2,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Bienvenue !',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
            SizedBox(height: 242),
            LargeCardPopular(),
            SizedBox(height: 10),
            LargeCardPopular(),
            SizedBox(height: 10),
            LargeCardPopular(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
