import 'package:flutter/material.dart';
import 'package:flutter_projet_final/api/model/list/responseAPIMoviesList.dart';
import 'package:flutter_projet_final/api/model/descr/responseAPIMovieDescr.dart';

import 'api/comicVineAPI.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MoviesListPage(),
    );
  }
}

class MoviesListPage extends StatefulWidget {
  @override
  _MoviesListPageState createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  final ComicVineAPIManager apiManager = ComicVineAPIManager();
  List<OFFMovies> _movies = [];
  String _error = '';

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  Future<void> _fetchMovies() async {
    setState(() {
      _movies = [];
      _error = '';
    });

    try {
      final response = await apiManager
          .getMovies('793241465e20a2c4efd78bcfaa9df4356b780449');
      setState(() {
        _movies = response.results ?? [];
      });
    } catch (e) {
      setState(() {
        _error = 'Erreur lors de la récupération des films : $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Films'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              if (_error.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _error,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              if (_movies.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _movies.length,
                  itemBuilder: (context, index) {
                    final movie = _movies[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: ListTile(
                        leading: movie.image != null
                            ? Image.network(
                                movie.image!.smallUrl ?? '',
                                width: 50,
                                height: 75,
                                fit: BoxFit.cover,
                              )
                            : const SizedBox(),
                        title: Text(movie.name ?? 'Inconnu'),
                        subtitle: Text(
                            'ID: ${movie.id} - Durée: ${movie.runtime ?? 'Inconnue'}'),
                        trailing: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetailsPage(movieId: movie.id!),
                              ),
                            );
                          },
                          child: const Text('Détails'),
                        ),
                      ),
                    );
                  },
                ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieDetailsPage extends StatefulWidget {
  final int movieId;

  const MovieDetailsPage({super.key, required this.movieId});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final ComicVineAPIManager apiManager = ComicVineAPIManager();
  OFFMovieDescr? _movieDetails;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _fetchMovieDetails(widget.movieId);
  }

  Future<void> _fetchMovieDetails(int id) async {
    setState(() {
      _movieDetails = null;
      _error = '';
    });

    try {
      final response = await apiManager.getMovieDescr(
        '793241465e20a2c4efd78bcfaa9df4356b780449',
        id,
      );
      setState(() {
        _movieDetails = response.results;
      });
    } catch (e) {
      setState(() {
        _error = 'Erreur lors de la récupération des détails du film : $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails du Film'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (_error.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _error,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              if (_movieDetails != null) ...[
                Text(
                  'Nom : ${_movieDetails?.name ?? "Inconnu"}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text('ID : ${_movieDetails?.id ?? "Inconnu"}'),
                Text('Durée : ${_movieDetails?.runtime ?? "Inconnue"}'),
                if (_movieDetails?.description != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        _movieDetails!.description ?? 'Pas de description'),
                  ),
                if (_movieDetails?.image != null)
                  Image.network(
                    _movieDetails!.image!.smallUrl ?? '',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                if (_movieDetails?.characters != null &&
                    _movieDetails!.characters!.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  const Text('Personnages:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  ..._movieDetails!.characters!
                      .map((character) => Text(character.name ?? 'Inconnu'))
                      .toList(),
                ],
                if (_movieDetails?.studios != null &&
                    _movieDetails!.studios!.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  const Text('Studios:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  ..._movieDetails!.studios!
                      .map((studio) => Text(studio.name ?? 'Inconnu'))
                      .toList(),
                ],
                if (_movieDetails?.producers != null &&
                    _movieDetails!.producers!.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  const Text('Producteurs:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  ..._movieDetails!.producers!
                      .map((producer) => Text(producer.name ?? 'Inconnu'))
                      .toList(),
                ],
                if (_movieDetails?.budget != null)
                  Text('Budget : ${_movieDetails?.budget ?? "Inconnu"}'),
                if (_movieDetails?.box_office_revenue != null)
                  Text(
                      'Box office : ${_movieDetails?.box_office_revenue ?? "Inconnu"}'),
              ],
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Retour'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
