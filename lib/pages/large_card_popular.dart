import 'package:flutter/material.dart';
import 'package:flutter_projet_final/api/model/list/responseAPIMoviesList.dart';
import 'package:flutter_projet_final/model/seriesListModel.dart';
import 'package:flutter_projet_final/pages/list_comics.dart';
import 'package:flutter_projet_final/res/app_colors.dart';
import 'package:go_router/go_router.dart';
import '../api/model/list/responseAPISeriesList.dart';
import 'little_cards.dart';

class LargeCardPopular extends StatelessWidget {
  final String title;
  final SeriesListModel? seriesList;
  final SeriesListModel? issueList;
  final SeriesListModel? movieList;

  final List<String> data = ["serie 1", "serie 2", "serie 3", "serie 4"];

  LargeCardPopular(
      {super.key,
      required this.title,
      this.seriesList,
      this.issueList,
      this.movieList});

  List<Map<String, String?>> extractNameAndImageUrl(
      SeriesListModel seriesList) {
    // Utiliser .map() pour créer une nouvelle liste de Map contenant 'name' et 'imageUrl'
    return seriesList.seriesListModel.map((serie) {
      return {
        'name': serie.name, // Nom de la série
        'imageUrl': serie.image?.smallUrl, // URL de l'image
      };
    }).toList(); // Retourner la liste finale
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String?>> seriesData = extractNameAndImageUrl(seriesList!);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
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
                      backgroundColor: AppColors.orange,
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
                    backgroundColor:
                        WidgetStateProperty.all(AppColors.bottomBarBackground),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                  child: const Text('Voir plus'),
                  onPressed: () {
                    context.push('/series');
                    context.push('/comics');
                    context.push('/movies');
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
                            title: seriesData[index]['name'] ??
                                "Nom non disponible",
                            imageUrl: seriesData[index]['imageUrl'] ??
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
