import 'package:flutter/material.dart';
import 'package:flutter_projet_final/api/comicVineAPI.dart';
import 'package:flutter_projet_final/api/model/descr/responseAPISerieDescr.dart';
import 'package:flutter_projet_final/api/model/list/responseAPISeriesList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ComicVine Series',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Liste des séries'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ComicVineAPIManager apiManager = ComicVineAPIManager();
  List<OFFSeries> _seriesList = [];
  String _error = '';

  Future<void> _fetchSeries() async {
    setState(() {
      _error = '';
      _seriesList = [];
    });

    try {
      final response = await apiManager
          .getSeries('793241465e20a2c4efd78bcfaa9df4356b780449');
      if (response.results != null) {
        setState(() {
          _seriesList = response.results!;
        });
      } else {
        setState(() {
          _error = 'Aucune série trouvée ou erreur inconnue.';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Erreur : $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Liste des séries :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              if (_error.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _error,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              if (_seriesList.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _seriesList.length,
                  itemBuilder: (context, index) {
                    final serie = _seriesList[index];

                    return ListTile(
                      leading: serie.image?.smallUrl != null
                          ? Image.network(
                              serie.image!.smallUrl!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )
                          : const Icon(Icons.broken_image),
                      title: Text(serie.name ?? 'Nom inconnu'),
                      subtitle: Text(
                        'ID: ${serie.id ?? 'Inconnu'}\n'
                        'Épisodes: ${serie.count_of_episodes ?? 'Inconnu'}',
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.info),
                        onPressed: () {
                          // Navigue vers la page de détails
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SerieDetailsPage(
                                serieId: serie.id!,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _fetchSeries,
                child: const Text('Charger les séries'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SerieDetailsPage extends StatefulWidget {
  final int serieId;

  const SerieDetailsPage({super.key, required this.serieId});

  @override
  State<SerieDetailsPage> createState() => _SerieDetailsPageState();
}

class _SerieDetailsPageState extends State<SerieDetailsPage> {
  final ComicVineAPIManager apiManager = ComicVineAPIManager();
  OFFSerieDescr? _serieDetails;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _fetchSerieDetails(widget.serieId);
  }

  Future<void> _fetchSerieDetails(int id) async {
    setState(() {
      _serieDetails = null;
      _error = '';
    });

    try {
      final response = await apiManager.getSerieDescr(
          '793241465e20a2c4efd78bcfaa9df4356b780449', id);
      if (response.results != null) {
        setState(() {
          _serieDetails = response.results!;
        });
      } else {
        setState(() {
          _error = 'Détails de la série non trouvés.';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Erreur : $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails de la série'),
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
              if (_serieDetails != null) ...[
                Text(
                  'Nom de la série : ${_serieDetails?.name ?? "Inconnu"}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text('ID de la série : ${_serieDetails?.id ?? "Inconnu"}'),
                Text(
                    'Nombre d\'épisodes : ${_serieDetails?.count_of_episodes ?? "Inconnu"}'),
                Text(
                    'Description : ${_serieDetails?.description ?? "Aucune description"}'),
                if (_serieDetails?.image != null)
                  Image.network(
                    _serieDetails!.image!.smallUrl ?? '',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                if (_serieDetails?.publisher != null)
                  Text(
                      'Éditeur : ${_serieDetails?.publisher?.name ?? "Inconnu"}'),
                if (_serieDetails?.characters != null &&
                    _serieDetails!.characters!.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Personnages :'),
                      ..._serieDetails!.characters!
                          .map((character) => Text(character.name ?? "Inconnu"))
                          .toList(),
                    ],
                  ),
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
