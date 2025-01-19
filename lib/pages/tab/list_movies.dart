import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projet_final/pages/blocs/moviesPageBloc.dart';
import 'package:flutter_projet_final/pages/card_movies.dart';
import 'package:flutter_projet_final/res/app_colors.dart';

class ListMovies extends StatefulWidget {
  const ListMovies({super.key});

  @override
  State<ListMovies> createState() => _ListMoviesState();
}

class _ListMoviesState extends State<ListMovies> {
  MoviesListPageState? state;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => LoadDataMoviesListBloc(),
        child: BlocBuilder<LoadDataMoviesListBloc, MoviesListPageState>(
          builder: (BuildContext context, state) {
            return switch (state) {
              MoviesListPageNotifierLoadingState() => const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ),
              MoviesListPageNotifierErrorState() => Scaffold(
                  body: Center(
                    child: Text(state.error.toString(),
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
              MoviesListPageNotifierSuccessState() => Scaffold(
                  backgroundColor: AppColors.grey2,
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: const EdgeInsets.only(top: 40),
                            padding: const EdgeInsets.all(16.0),
                            child: const Text(
                              'Films les plus populaires',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: 700, //TODO à changer (peut-être)
                            child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: List.generate(
                                    100,
                                    (index) => Padding(
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      child: CardMovies(
                                        movie: state
                                            .moviesList.moviesListModel[index],
                                        index: index + 1,
                                      ),
                                    ),
                                  ),
                                ))),
                      ],
                    ),
                  ),
                )
            };
          },
        ));
  }
}
