import 'package:flutter/material.dart';
import 'package:flutter_projet_final/model/list/issuesListModel.dart';
import 'package:flutter_projet_final/model/list/moviesListModel.dart';
import 'package:flutter_projet_final/res/app_colors.dart';
import '../model/list/seriesListModel.dart';
import 'little_cards.dart';

class LargeCardPopular extends StatelessWidget {
  final String title;
  final SeriesListModel? seriesList;
  final IssuesListModel? issuesList;
  final MoviesListModel? moviesList;

  const LargeCardPopular({
    super.key,
    required this.title,
    this.seriesList,
    this.issuesList,
    this.moviesList,
  });

  List<Map<String, String?>> extractNameImageList() {
    if (seriesList != null) {
      return seriesList!.seriesListModel.map((serie) {
        return {
          'name': serie.name,
          'imageUrl': serie.image?.smallUrl,
        };
      }).toList();
    }
    if (issuesList != null) {
      return issuesList!.issuesListModel.map((issue) {
        return {
          'name': issue.nameSaga,
          'imageUrl': issue.image?.smallUrl,
        };
      }).toList();
    }
    if (moviesList != null) {
      return moviesList!.moviesListModel.map((movie) {
        return {
          'name': movie.name,
          'imageUrl': movie.image?.smallUrl,
        };
      }).toList();
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String?>> data = extractNameImageList();

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
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.orange,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      title,
                      style: const TextStyle(
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
            SizedBox(
                height: 242,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        100,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: LittleCards(
                            title: data[index]['name'] ?? "Nom non disponible",
                            imageUrl: data[index]['imageUrl'] ??
                                "", // Si le composant LittleCards accepte des données
                          ),
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
