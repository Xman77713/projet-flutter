import 'package:flutter/material.dart';
import 'package:flutter_projet_final/model/list/seriesListModel.dart';
import 'package:flutter_projet_final/res/app_colors.dart';

class CardSeries extends StatelessWidget {
  final SerieModel serie;
  final int index;

  const CardSeries({super.key, required this.serie, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.all(14),
      child: Center(
        child: Container(
          height: 162,
          width: 359,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 26, 49, 73),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          serie.getImageUrl().smallUrl ?? 'Image indisponible',
                          height: 131,
                          width: 129,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        width: 59,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '#$index',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        serie.name ?? 'Nom indisponible',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const Icon(
                            Icons.movie_edit,
                            color: AppColors.bottomBarUnselectedText,
                            size: 17,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            serie.publisher?.name ?? 'Publisher indisponible',
                            style: const TextStyle(
                              color: AppColors.bottomBarUnselectedText,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 7),
                      Row(
                        children: [
                          const Icon(
                            Icons.tv_outlined,
                            color: AppColors.bottomBarUnselectedText,
                            size: 17,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${serie.count_of_episodes ?? 'XX'} épisodes',
                            style: const TextStyle(
                              color: AppColors.bottomBarUnselectedText,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: AppColors.bottomBarUnselectedText,
                            size: 17,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            serie.date_added.toString().split(' ')[0],
                            style: const TextStyle(
                              color: AppColors.bottomBarUnselectedText,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
