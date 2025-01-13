import 'package:flutter/material.dart';
import 'package:flutter_projet_final/res/app_colors.dart';
import 'little_cards.dart';

class LargeCardPopular extends StatelessWidget {
  const LargeCardPopular({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.orange,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Séries populaires',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(AppColors.grey2),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                  child: const Text('Voir plus'),
                  onPressed: () {
                    print('Bouton "Voir plus" appuyé');
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 242,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    LittleCards(),
                    SizedBox(width: 5),
                    LittleCards(),
                    SizedBox(width: 5),
                    LittleCards(),
                    SizedBox(width: 5),
                    LittleCards(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
