import 'package:flutter/material.dart';
import 'package:flutter_projet_final/res/app_colors.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class SecondBlocDetailsMoviesSynopsis extends StatelessWidget {
  final String? description;

  const SecondBlocDetailsMoviesSynopsis({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.all(14),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: HtmlWidget(description ?? 'Description indisponible')
                //TODO scroll bar à ajouter et couleur à changer
                ),
          ),
        ),
      ),
    );
  }
}
