import 'package:flutter/material.dart';
import 'package:flutter_projet_final/res/app_colors.dart';

class SecondBlocDetailsMoviesSynopsis extends StatelessWidget {
  const SecondBlocDetailsMoviesSynopsis({super.key});

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
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'The watchmen, follows a group of retired superheroes, as they attempt to foil a plot to kill off masked superheroes.',
                style: TextStyle(
                  fontSize: 20,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
