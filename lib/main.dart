import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projet_final/res/app_colors.dart';
import 'package:go_router/go_router.dart';

import 'interface/pages/blocs/HomePageBloc.dart';
import 'interface/pages/detailsIssue.dart';
import 'interface/pages/detailsSerie.dart';
import 'interface/pages/first_bloc_details_movies.dart';
import 'interface/pages/home_page.dart';

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
              path: '/serie/:id',
              builder: (BuildContext context, GoRouterState state) {
                final serieId = int.parse(state.pathParameters['id']!);
                return DetailsSerie(serieId: serieId);
              }),
          GoRoute(
              path: '/issue/:id',
              builder: (BuildContext context, GoRouterState state) {
                final issueId = int.parse(state.pathParameters['id']!);
                return DetailsIssue(issueId: issueId);
              }),
          GoRoute(
              path: '/movie/:id',
              builder: (BuildContext context, GoRouterState state) {
                final movieId = int.parse(state.pathParameters['id']!);
                return FirstBlocDetailsMovies(movieId: movieId);
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
          scaffoldBackgroundColor: AppColors.screenBackground),
      routerConfig: _router,
    );
  }
}
