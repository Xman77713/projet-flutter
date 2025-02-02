import 'package:flutter/material.dart';

import '../../res/app_colors.dart';

class DetailsIssue extends StatelessWidget {
  final int issueId;

  const DetailsIssue({super.key, required this.issueId});

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
              "Détails d'un comic",
              style: TextStyle(color: AppColors.text, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
