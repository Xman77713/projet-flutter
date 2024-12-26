import 'package:flutter/material.dart';
import 'package:flutter_projet_final/res/app_colors.dart';
import 'little_cards.dart';

class LargeCardPopular extends StatelessWidget {
  const LargeCardPopular({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(
            16.0), // Espacement extérieur (autour du fond bleu)
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.gray3,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0), // Réduit l'espace intérieur
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Adapte la taille au contenu
              children: [
                // Titre
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Séries populaires',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('TextButton'),
                    ),
                  ],
                ),
                // Cartes
                SizedBox(
                  height: 242, // Hauteur adaptée aux cartes
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        LittleCards(),
                        SizedBox(width: 16), // Espacement entre les cartes
                        LittleCards(),
                        SizedBox(width: 16),
                        LittleCards(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
