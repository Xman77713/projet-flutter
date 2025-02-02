import 'package:flutter/material.dart';

import '../../res/app_colors.dart';

class DetailsSerie extends StatelessWidget {
  final int serieId;

  const DetailsSerie({super.key, required this.serieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back, color: AppColors.text),
            ),
          ),
          const Center(
            child: Text(
              "Détails d'une série",
              style: TextStyle(color: AppColors.text, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
