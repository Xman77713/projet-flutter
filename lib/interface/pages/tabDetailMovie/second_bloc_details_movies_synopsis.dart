import 'package:flutter/material.dart';
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
          height: 700,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 26, 49, 73),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: HtmlWidget(description ?? 'Description indisponible')
                //TODO scroll bar à ajouter et couleur à changer
                // Text(
                //   description ?? 'Description indisponible',
                //   style: const TextStyle(
                //     fontSize: 20,
                //     height: 1.5,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.white,
                //   ),
                //   textAlign: TextAlign.left,
                // ),
                ),
          ),
        ),
      ),
    );
  }
}
