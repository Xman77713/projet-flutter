import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projet_final/model/list/issuesListModel.dart';
import 'package:flutter_projet_final/model/list/moviesListModel.dart';
import 'package:flutter_projet_final/pages/large_card_popular.dart';
import 'package:flutter_projet_final/pages/tab/list_comics.dart';
import 'package:flutter_projet_final/pages/tab/list_movies.dart';
import 'package:flutter_projet_final/pages/tab/list_series.dart';
import 'package:flutter_projet_final/pages/blocs/HomePageBloc.dart';
import 'package:flutter_projet_final/res/app_colors.dart';

import '../api/comicVineAPI.dart';
import '../model/list/seriesListModel.dart';

class HomePage extends StatefulWidget {
  final ComicVineAPI comicVineAPI =
      ComicVineAPI(Dio(), baseUrl: 'https://comicvine.gamespot.com/api');

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Bienvenue !',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
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

class _HomePageState extends State<HomePage> {
  int _tabPosition = 0;
  HomePageState? state;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoadDataBloc(),
      child: BlocBuilder<LoadDataBloc, HomePageState>(
        builder: (BuildContext context, state) {
          return switch (state) {
            HomePageNotifierLoadingState() => const Scaffold(
                body: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            HomePageNotifierErrorState() => Scaffold(
                body: Center(
                  child: Text(state.error.toString(),
                      style: const TextStyle(color: Colors.white)),
                ),
              ),
            HomePageNotifierSuccessState() => Scaffold(
                body: Stack(
                  children: [
                    Positioned.fill(
                      child: Offstage(
                        offstage: _tabPosition != 0,
                        child: HomePageTab(
                          seriesList: state.seriesList,
                          issuesList: state.issuesList,
                          moviesList: state.moviesList,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Offstage(
                        offstage: _tabPosition != 1,
                        child: const ComicsPageTab(),
                      ),
                    ),
                    Positioned.fill(
                      child: Offstage(
                        offstage: _tabPosition != 2,
                        child: const SeriePageTab(),
                      ),
                    ),
                    Positioned.fill(
                      child: Offstage(
                        offstage: _tabPosition != 3,
                        child: const MoviePageTab(),
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: NavigationBar(
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.home),
                      label: 'Accueil',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.menu_book_outlined),
                      label: 'Comics',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.live_tv_outlined),
                      label: 'Séries',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.local_movies),
                      label: 'Films',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.search),
                      label: 'Recherche',
                    ),
                  ],
                  selectedIndex: _tabPosition,
                  onDestinationSelected: (int position) {
                    setState(() {
                      _tabPosition = position;
                    });
                  },
                ),
              )
          };
        },
      ),
    );
  }

  Widget get body {
    switch (_tabPosition) {
      case 0:
        return HomePageTab(
          seriesList: state?.seriesList,
          issuesList: state?.issuesList,
          moviesList: state?.moviesList,
        );
      case 1:
        return const ComicsPageTab();
      case 2:
        return const SeriePageTab();
      case 3:
        return const MoviePageTab();
      case 4:
        return const SearchPageTab();
      default:
        throw Exception();
    }
  }
}

class HomePageTab extends StatelessWidget {
  final SeriesListModelHP seriesList;
  final IssuesListModelHP issuesList;
  final MoviesListModelHP moviesList;

  const HomePageTab(
      {super.key,
      required this.seriesList,
      required this.issuesList,
      required this.moviesList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Bienvenue !',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            LargeCardPopular(
              title: "Séries populaires",
              seriesList: seriesList,
            ),
            const SizedBox(height: 10),
            LargeCardPopular(
              title: "Comics populaires",
              issuesList: issuesList,
            ),
            const SizedBox(height: 10),
            LargeCardPopular(
              title: "Films populaires",
              moviesList: moviesList,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class ComicsPageTab extends StatelessWidget {
  const ComicsPageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ListComics());
  }
}

class SeriePageTab extends StatelessWidget {
  const SeriePageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ListSeries());
  }
}

class MoviePageTab extends StatelessWidget {
  const MoviePageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ListMovies());
  }
}

class SearchPageTab extends StatelessWidget {
  const SearchPageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Recherche", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
