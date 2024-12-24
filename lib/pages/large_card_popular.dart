import 'package:flutter/material.dart';
import 'package:flutter_projet_final/res/app_colors.dart';
import 'little_cards.dart';

class LargeCardPopular extends StatelessWidget {
  const LargeCardPopular({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.gray3,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Séries populaires',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Action pour "Voir plus"
                      },
                      child: const Text(
                        'Voir plus',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                const Expanded(
                  child: LittleCards(),
                ),
                const Expanded(
                  child: LittleCards(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
