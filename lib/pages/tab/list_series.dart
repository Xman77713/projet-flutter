import 'package:flutter/material.dart';
import 'package:flutter_projet_final/pages/card_series.dart';
import 'package:flutter_projet_final/res/app_colors.dart';

class ListSeries extends StatelessWidget {
  const ListSeries({super.key});

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
                  'Séries les plus populaires',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 2),
            const CardSeries(),
            const SizedBox(height: 2),
            const CardSeries(),
            const SizedBox(height: 2),
            const CardSeries(),
            const SizedBox(height: 2),
            const CardSeries(),
            const SizedBox(height: 2),
            const CardSeries(),
            const SizedBox(height: 2),
          ],
        ),
      ),
    );
  }
}
