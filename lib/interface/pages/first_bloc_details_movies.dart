import 'dart:ui'; // Pour le flou

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projet_final/interface/pages/tabDetailMovie/second_bloc_details_movies_infos.dart';
import 'package:flutter_projet_final/interface/pages/tabDetailMovie/second_bloc_details_movies_people.dart';
import 'package:flutter_projet_final/interface/pages/tabDetailMovie/second_bloc_details_movies_synopsis.dart';
import 'package:flutter_projet_final/res/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

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
            MovieDescrPageNotifierLoadingState() => const Scaffold(
                body: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            MovieDescrPageNotifierErrorState() => Scaffold(
                body: Center(
                  child: Text(state.error.toString(),
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                          color: AppColors.text,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )),
                ),
              ),
            MovieDescrPageNotifierSuccessState() => DefaultTabController(
                length: 3,
                child: Scaffold(
                  body: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          state.movieDescr.movieDModel
                                  .getImageUrl()
                                  .mediumUrl ??
                              'Image indisponible',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 40, left: 16, right: 16),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: AppColors.text,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    state.movieDescr.movieDModel.name ??
                                        'Nom indisponible',
                                    style: const TextStyle(
                                      color: AppColors.text,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
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
                                  children: [
                                    const SizedBox(height: 40),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.theaters,
                                          color: AppColors.text,
                                          size: 17,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                            '${state.movieDescr.movieDModel.runtime ?? 'XX'} minutes',
                                            style: GoogleFonts.nunito(
                                              textStyle: const TextStyle(
                                                color: AppColors.text,
                                                fontSize: 14,
                                              ),
                                            )),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_today,
                                          color: AppColors.text,
                                          size: 17,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                            state.movieDescr.movieDModel
                                                .date_added
                                                .toString()
                                                .split(' ')[0],
                                            style: GoogleFonts.nunito(
                                              textStyle: const TextStyle(
                                                color: AppColors.text,
                                                fontSize: 14,
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          TabBar(
                            tabs: const <Widget>[
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
                            labelColor: AppColors.text,
                            unselectedLabelColor:
                                AppColors.bottomBarUnselectedText,
                            indicatorWeight: 6.0,
                            labelStyle: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                color: AppColors.text,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          // Contenu des onglets
                          Expanded(
                            child: TabBarView(
                              children: <Widget>[
                                SecondBlocDetailsMoviesSynopsis(
                                  description:
                                      state.movieDescr.movieDModel.description,
                                ),
                                const SecondBlocDetailsMoviesPeople(
                                    listId: [1253, 1253]),
                                SecondBlocDetailsMoviesInfos(
                                  producers:
                                      state.movieDescr.movieDModel.producers,
                                  studios: state.movieDescr.movieDModel.studios,
                                  budget: state.movieDescr.movieDModel.budget,
                                  box_office_revenue: state.movieDescr
                                      .movieDModel.box_office_revenue,
                                  rating: state.movieDescr.movieDModel.rating,
                                  writers: state.movieDescr.movieDModel.writers,
                                  total_revenue: state
                                      .movieDescr.movieDModel.total_revenue,
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
          };
        },
      ),
    );
  }
}
