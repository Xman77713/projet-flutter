import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projet_final/pages/card_comics.dart';
import 'package:flutter_projet_final/pages/card_series.dart';
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

// final GoRouter _router = Gorouter(routes: [
//   GoRoute(
//        path: '/series'
//    builder: (BuildContext context, GoRouterState state) => BlocProvider(
//               create: (_) => LoadDataBloc(),
//               child:  const ListSeries(),
//             ),
//       )

// ]);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.screenBackground),
      home: BlocProvider(
        create: (_) => SeriesListBloc(),
        child: HomePage(),
      ),
    );
  }
}
// class MyApp extends StatelessWidget {
//   final GoRouter _router = GoRouter(
//     routes: [
//       GoRoute(
//         path: '/series',
//         builder: (BuildContext context, GoRouterState state) => BlocProvider(
//           create: (_) => LoadDataBloc(),
//           child: const ListSeries(),
//         ),
//       ),
//     ],
//   );

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerConfig: _router,
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
