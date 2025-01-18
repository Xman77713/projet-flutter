import 'package:flutter/material.dart';
import 'package:flutter_projet_final/res/app_colors.dart';

class SecondBlocDetailsMoviesPeople extends StatelessWidget {
  const SecondBlocDetailsMoviesPeople({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.all(14),
      child: Center(
        child: Container(
          width: double.infinity,
          height: 700,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 26, 49, 73),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              // Ajout de SingleChildScrollView
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://media.istockphoto.com/id/1209654046/fr/vectoriel/illustration-noire-dic%C3%B4ne-de-profil-dutilisateur.jpg?s=612x612&w=0&k=20&c=oEfoQr1uRwCdQUG5sabJxBoZ7XZgvrvNhtEKj0phAAQ=',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        'Andy Warhol',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://media.istockphoto.com/id/1209654046/fr/vectoriel/illustration-noire-dic%C3%B4ne-de-profil-dutilisateur.jpg?s=612x612&w=0&k=20&c=oEfoQr1uRwCdQUG5sabJxBoZ7XZgvrvNhtEKj0phAAQ=',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        'Andy Warhol',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://media.istockphoto.com/id/1209654046/fr/vectoriel/illustration-noire-dic%C3%B4ne-de-profil-dutilisateur.jpg?s=612x612&w=0&k=20&c=oEfoQr1uRwCdQUG5sabJxBoZ7XZgvrvNhtEKj0phAAQ=',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        'Andy Warhol',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://media.istockphoto.com/id/1209654046/fr/vectoriel/illustration-noire-dic%C3%B4ne-de-profil-dutilisateur.jpg?s=612x612&w=0&k=20&c=oEfoQr1uRwCdQUG5sabJxBoZ7XZgvrvNhtEKj0phAAQ=',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        'Andy Warhol',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
