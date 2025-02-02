import 'package:flutter/material.dart';
import 'package:flutter_projet_final/res/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/list/issuesListModel.dart';
import '../../model/list/moviesListModel.dart';
import '../../model/list/seriesListModel.dart';
import 'little_cards.dart';

class LargeCardPopular extends StatelessWidget {
  final String title;
  final SeriesListModelHP? seriesList;
  final IssuesListModelHP? issuesList;
  final MoviesListModelHP? moviesList;

  final void Function(int tabPosition) setTab;

  const LargeCardPopular({
    super.key,
    required this.title,
    required this.setTab,
    this.seriesList,
    this.issuesList,
    this.moviesList,
  });

  List<Object> extractNameImageList() {
    if (seriesList != null) {
      int type = 1;
      return [
        seriesList!.seriesListModelHP.map((serie) {
          return {
            'name': serie.name,
            'imageUrl': serie.image?.smallUrl,
            'id': serie.id.toString(),
          };
        }).toList(),
        type
      ];
    }
    if (issuesList != null) {
      int type = 2;
      return [
        issuesList!.issuesListModelHP.map((issue) {
          return {
            'name': issue.name?.name,
            'imageUrl': issue.image?.smallUrl,
            'id': issue.id.toString(),
          };
        }).toList(),
        type
      ];
    }
    if (moviesList != null) {
      int type = 3;
      return [
        moviesList!.moviesListModelHP.map((movie) {
          return {
            'name': movie.name,
            'imageUrl': movie.image?.smallUrl,
            'id': movie.id.toString(),
          };
        }).toList(),
        type
      ];
    } else {
      return [[], 0];
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String?>> data =
        extractNameImageList()[0] as List<Map<String, String?>>;

    int type = extractNameImageList()[1] as int;

    return Container(
      margin: const EdgeInsets.only(left: 9),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
                    const SizedBox(width: 9),
                    Text(
                      title,
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(AppColors.seeMoreBackground),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                  child: const Text('Voir plus'),
                  onPressed: () {
                    if (seriesList != null) {
                      setTab(2);
                    } else if (issuesList != null) {
                      setTab(1);
                    } else if (moviesList != null) {
                      setTab(3);
                    }
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
                    5,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: LittleCards(
                        title: data[index]['name'] ?? "Nom non disponible",
                        imageUrl: data[index]['imageUrl'] ?? "",
                        id: int.parse(data[index]['id']!),
                        type: type,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
