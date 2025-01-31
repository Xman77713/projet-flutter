import 'package:flutter/material.dart';
import 'package:flutter_projet_final/res/app_colors.dart';
import 'package:go_router/go_router.dart';

import '../../model/list/moviesListModel.dart';

class CardMovies extends StatelessWidget {
  final MovieModel movie;
  final int index;

  const CardMovies({super.key, required this.movie, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.all(14),
      child: Center(
        child: Container(
          height: 160,
          width: 359,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 26, 49, 73),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              movie.getImageUrl().mediumUrl ??
                                  'Image indisponible',
                              height: 118,
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
                          InkWell(
                            onTap: () {
                              context.go('/movie/${movie.id}');
                            },
                            child: Text(
                              movie.name ?? 'Nom indisponible',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          const SizedBox(height: 60),
                          Row(
                            children: [
                              const Icon(
                                Icons.theaters,
                                color: AppColors.bottomBarUnselectedText,
                                size: 17,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '${movie.runtime ?? 'XX'} minutes',
                                style: const TextStyle(
                                  color: AppColors.bottomBarUnselectedText,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_today,
                                color: AppColors.bottomBarUnselectedText,
                                size: 17,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                movie.date_added.toString().split(' ')[0],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
