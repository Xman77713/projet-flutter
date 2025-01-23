import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projet_final/interface/pages/tabHomePage/list_comics.dart';
import 'package:flutter_projet_final/interface/pages/tabHomePage/list_movies.dart';
import 'package:flutter_projet_final/interface/pages/tabHomePage/list_series.dart';
import 'package:flutter_projet_final/res/app_colors.dart';

import '../model/list/issuesListModel.dart';
import '../model/list/moviesListModel.dart';
import '../model/list/seriesListModel.dart';
import 'blocs/HomePageBloc.dart';
import 'card/large_card_popular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
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
                          setTab: _setTab,
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
                    Positioned.fill(
                      child: Offstage(
                        offstage: _tabPosition != 4,
                        child: const SearchPageTab(),
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: NavigationBarTheme(
                  data: NavigationBarThemeData(
                    backgroundColor: AppColors.bottomBarBackground,
                    indicatorColor: const Color.fromARGB(255, 255, 0, 0),
                    labelTextStyle: WidgetStateProperty.all(
                      const TextStyle(
                        color: AppColors.bottomBarUnselectedText,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  child: NavigationBar(
                    indicatorColor: AppColors.bottomBarSelectedBackground,
                    destinations: const [
                      NavigationDestination(
                        icon: Icon(
                          Icons.home,
                          color: AppColors.bottomBarUnselectedText,
                        ),
                        label: 'Accueil',
                      ),
                      NavigationDestination(
                        icon: Icon(
                          Icons.menu_book_outlined,
                          color: AppColors.bottomBarUnselectedText,
                        ),
                        label: 'Comics',
                      ),
                      NavigationDestination(
                        icon: Icon(
                          Icons.live_tv_outlined,
                          color: AppColors.bottomBarUnselectedText,
                        ),
                        label: 'Séries',
                      ),
                      NavigationDestination(
                        icon: Icon(
                          Icons.local_movies,
                          color: AppColors.bottomBarUnselectedText,
                        ),
                        label: 'Films',
                      ),
                      NavigationDestination(
                        icon: Icon(
                          Icons.search,
                          color: AppColors.bottomBarUnselectedText,
                        ),
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
                ),
              )
          };
        },
      ),
    );
  }

  void _setTab(int position) {
    setState(() {
      _tabPosition = position;
    });
  }

  Widget get body {
    switch (_tabPosition) {
      case 0:
        return HomePageTab(
          seriesList: state?.seriesList,
          issuesList: state?.issuesList,
          moviesList: state?.moviesList,
          setTab: (int tabPosition) {},
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
  final void Function(int tabPosition) setTab;

  const HomePageTab(
      {super.key,
      required this.seriesList,
      required this.issuesList,
      required this.moviesList,
      required this.setTab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
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
              setTab: setTab,
            ),
            const SizedBox(height: 10),
            LargeCardPopular(
              title: "Comics populaires",
              issuesList: issuesList,
              setTab: setTab,
            ),
            const SizedBox(height: 10),
            LargeCardPopular(
              title: "Films populaires",
              moviesList: moviesList,
              setTab: setTab,
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
