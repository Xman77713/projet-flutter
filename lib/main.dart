import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projet_final/pages/blocs/HomePageBloc.dart';
import 'package:flutter_projet_final/pages/first_bloc_details_movies.dart';
import 'package:flutter_projet_final/pages/home_page.dart';
import 'package:flutter_projet_final/pages/large_card_popular.dart';
import 'package:flutter_projet_final/pages/list_movies.dart';
import 'package:flutter_projet_final/pages/second_bloc_details_movies_synopsis.dart';
import 'package:flutter_projet_final/pages/seriesListBloc.dart';
import 'package:flutter_projet_final/pages/card_movies.dart';
import 'package:flutter_projet_final/pages/list_comics.dart';
import 'package:flutter_projet_final/pages/list_movies.dart';
import 'package:flutter_projet_final/pages/list_series.dart';
import 'package:flutter_projet_final/res/app_colors.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(routes: [
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
              create: (_) => LoadDataBloc(),
              child: const HomePage(),
            ),
        routes: [
          GoRoute(
              path: '/movie/:id',
              builder: (BuildContext context, GoRouterState state) {
                final movieId = int.parse(state.pathParameters['id']!);
                return MovieDetailsPage(movieId: movieId);
              })
        ])
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.grey2),
      routerConfig: _router,
    );
  }
}
