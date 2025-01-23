import 'package:flutter/material.dart';
import 'package:flutter_projet_final/model/list/issuesListModel.dart';
import 'package:flutter_projet_final/model/list/moviesListModel.dart';
import 'package:flutter_projet_final/model/list/seriesListModel.dart';
import 'package:flutter_projet_final/pages/tab/list_comics.dart';
import 'package:flutter_projet_final/res/app_colors.dart';
import 'package:go_router/go_router.dart';
import '../api/model/list/responseAPISeriesList.dart';
import 'little_cards.dart';

class LargeCardPopular extends StatelessWidget {
  final String title;
  final SeriesListModelHP? seriesList;
  final IssuesListModelHP? issuesList;
  final MoviesListModelHP? moviesList;

  const LargeCardPopular({
    super.key,
    required this.title,
    this.seriesList,
    this.issuesList,
    this.moviesList,
  });

  List<Map<String, String?>> extractNameImageList() {
    if (seriesList != null) {
      return seriesList!.seriesListModelHP.map((serie) {
        return {
          'name': serie.name,
          'imageUrl': serie.image?.smallUrl,
        };
      }).toList();
    }
    if (issuesList != null) {
      return issuesList!.issuesListModelHP.map((issue) {
        return {
          'name': issue.name?.name,
          'imageUrl': issue.image?.smallUrl,
        };
      }).toList();
    }
    if (moviesList != null) {
      return moviesList!.moviesListModelHP.map((movie) {
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
                        20,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: LittleCards(
                            title: data[index]['name'] ?? "Nom indisponible",
                            imageUrl: data[index]['imageUrl'] ?? "",
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
