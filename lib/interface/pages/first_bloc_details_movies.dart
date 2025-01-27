import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projet_final/interface/pages/tabDetailMovie/second_bloc_details_movies_infos.dart';
import 'package:flutter_projet_final/interface/pages/tabDetailMovie/second_bloc_details_movies_people.dart';
import 'package:flutter_projet_final/interface/pages/tabDetailMovie/second_bloc_details_movies_synopsis.dart';
import 'package:flutter_projet_final/res/app_colors.dart';

import 'blocs/movieDescrPageBloc.dart';

class FirstBlocDetailsMovies extends StatefulWidget {
  final int movieId;

  const FirstBlocDetailsMovies({super.key, required this.movieId});

  @override
  State<FirstBlocDetailsMovies> createState() => _FirstBlocDetailsMoviesState();
}

class _FirstBlocDetailsMoviesState extends State<FirstBlocDetailsMovies> {
  MovieDescrPageState? state;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => LoadDataMovieDescrBloc(widget.movieId),
        child: BlocBuilder<LoadDataMovieDescrBloc, MovieDescrPageState>(
          builder: (BuildContext context, state) {
            return switch (state) {
              MovieDescrPageNotifierLoadingState() =>
              const Scaffold(
                body: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
              MovieDescrPageNotifierErrorState() =>
                  Scaffold(
                    body: Center(
                      child: Text(state.error.toString(),
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ),
              MovieDescrPageNotifierSuccessState() =>
                  DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      appBar: AppBar(
                        backgroundColor: const Color.fromARGB(255, 2, 8, 14),
                        title: Row(
                          children: [
                            const SizedBox(width: 8),
                            Text(
                              state.movieDescr.movieDModel.name ??
                                  'Nom indisponible',
                              style: const TextStyle(
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
                                    state.movieDescr.movieDModel
                                        .getImageUrl()
                                        .mediumUrl ??
                                        'Image indisponible',
                                    height: 127,
                                    width: 95,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 40),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.theaters,
                                          color: Colors.white,
                                          size: 17,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          '${state.movieDescr.movieDModel
                                              .runtime ?? 'XX'} minutes',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_today,
                                          color: Colors.white,
                                          size: 17,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          state.movieDescr.movieDModel
                                              .date_added
                                              .toString()
                                              .split(' ')[0],
                                          style: const TextStyle(
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
                            unselectedLabelColor:
                            AppColors.bottomBarUnselectedText,
                            indicatorWeight: 6.0,
                            labelStyle: TextStyle(fontSize: 17),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: <Widget>[
                                SecondBlocDetailsMoviesSynopsis(
                                    description:
                                    state.movieDescr.movieDModel.description),
                                const SecondBlocDetailsMoviesPeople(),
                                SecondBlocDetailsMoviesInfos(
                                  producers:
                                  state.movieDescr.movieDModel.producers,
                                  studios: state.movieDescr.movieDModel.studios,
                                  budget: state.movieDescr.movieDModel.budget,
                                  box_office_revenue: state
                                      .movieDescr.movieDModel
                                      .box_office_revenue,
                                  rating: state
                                      .movieDescr.movieDModel.rating,
                                  writers: state
                                      .movieDescr.movieDModel.writers,
                                  total_revenue: state
                                      .movieDescr.movieDModel.total_revenue,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
            };
          },
        ));
  }
}
