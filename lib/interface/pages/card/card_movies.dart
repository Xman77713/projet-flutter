import 'package:flutter/material.dart';
import 'package:flutter_projet_final/res/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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
      child: InkWell(
        onTap: () {
          context.go('/movie/${movie.id}');
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 160,
          width: 359,
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
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
                              color: AppColors.orange,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '#$index',
                              style: const TextStyle(
                                color: AppColors.text,
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
                            movie.name ?? 'Nom indisponible',
                            style: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                color: AppColors.text,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
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
                                style: GoogleFonts.nunito(
                                  textStyle: const TextStyle(
                                    color: AppColors.text,
                                    fontSize: 12,
                                  ),
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
                                style: GoogleFonts.nunito(
                                  textStyle: const TextStyle(
                                    color: AppColors.text,
                                    fontSize: 12,
                                  ),
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
