import 'package:flutter/material.dart';
import 'package:flutter_projet_final/interface/pages/tabDetailMovie/second_bloc_details_movies_infos.dart';
import 'package:flutter_projet_final/interface/pages/tabDetailMovie/second_bloc_details_movies_people.dart';
import 'package:flutter_projet_final/interface/pages/tabDetailMovie/second_bloc_details_movies_synopsis.dart';
import 'package:flutter_projet_final/interface/pages/tabHomePage/list_movies.dart';
import 'package:flutter_projet_final/res/app_colors.dart';

class FirstBlocDetailsMovies extends StatelessWidget {
  final int movieId;

  const FirstBlocDetailsMovies({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 2, 8, 14),
          title: const Row(
            children: [
              SizedBox(width: 8),
              Text(
                'Watchmen',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://i0.wp.com/www.filmspourenfants.net/wp-content/uploads/2018/10/titans-a.jpg?fit=333%2C446&ssl=1',
                      height: 127,
                      width: 95,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      Row(
                        children: [
                          Icon(
                            Icons.theaters,
                            color: Colors.white,
                            size: 17,
                          ),
                          SizedBox(width: 6),
                          Text(
                            '162 minutes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                            size: 17,
                          ),
                          SizedBox(width: 6),
                          Text(
                            '2009',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const TabBar(
              tabs: <Widget>[
                SizedBox(
                  width: 120,
                  child: Tab(
                    text: 'Synopsis',
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: Tab(
                    text: 'Personnages',
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: Tab(
                    text: 'Infos',
                  ),
                ),
              ],
              indicatorColor: AppColors.orange,
              labelColor: Colors.white,
              unselectedLabelColor: AppColors.bottomBarUnselectedText,
              indicatorWeight: 6.0,
              labelStyle: TextStyle(fontSize: 17),
            ),
            const Expanded(
              child: TabBarView(
                children: <Widget>[
                  SecondBlocDetailsMoviesSynopsis(),
                  SecondBlocDetailsMoviesPeople(),
                  SecondBlocDetailsMoviesInfos(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
