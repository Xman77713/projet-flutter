import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projet_final/pages/large_card_popular.dart';
import 'package:flutter_projet_final/pages/seriesListBloc.dart';
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
  late SeriesListState state;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SeriesListBloc(),
      child: BlocBuilder<SeriesListBloc, SeriesListState>(
        builder: (BuildContext context, state) {
          return switch (state) {
            ProductNotifierLoadingState() => const Scaffold(
                body: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            SeriesListNotifierErrorState() => Scaffold(
                body: Center(
                  child: Text(state.error.toString(),
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            SeriesListNotifierSuccessState() => Scaffold(
                body: Stack(
                  children: [
                    Positioned.fill(
                      child: Offstage(
                        offstage: _tabPosition != 0,
                        child: ProductPageTab0(seriesList: state.seriesList),
                      ),
                    ),
                    Positioned.fill(
                      child: Offstage(
                        offstage: _tabPosition != 1,
                        child: const ProductPageTab1(),
                      ),
                    ),
                    Positioned.fill(
                      child: Offstage(
                        offstage: _tabPosition != 2,
                        child: const ProductPageTab2(),
                      ),
                    ),
                    Positioned.fill(
                      child: Offstage(
                        offstage: _tabPosition != 3,
                        child: const ProductPageTab3(),
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
        return ProductPageTab0(
          seriesList: state.seriesList,
        );
      case 1:
        return const ProductPageTab1();
      case 2:
        return const ProductPageTab2();
      case 3:
        return const ProductPageTab3();
      case 4:
        return const ProductPageTab4();
      default:
        throw Exception();
    }
  }
}

class ProductPageTab0 extends StatelessWidget {
  final SeriesListModel seriesList;

  const ProductPageTab0({super.key, required this.seriesList});

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
              seriesList: seriesList,
            ),
            const SizedBox(height: 10),
            LargeCardPopular(
              title: "Films populaires",
              seriesList: seriesList,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class ProductPageTab1 extends StatelessWidget {
  const ProductPageTab1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Comics", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class ProductPageTab2 extends StatelessWidget {
  const ProductPageTab2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Séries", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class ProductPageTab3 extends StatelessWidget {
  const ProductPageTab3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Films", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class ProductPageTab4 extends StatelessWidget {
  const ProductPageTab4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Recherche", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
