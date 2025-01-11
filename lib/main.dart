import 'package:flutter/material.dart';
import 'api/comicVineAPI.dart';
import 'api/model/responseAPISeriesList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ComicVine API Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ComicVine API Test'),
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
                'Résultat de l\'API :',
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
                    final series = _seriesList[index];
                    return ListTile(
                      leading: series.image?.smallUrl != null
                          ? Image.network(
                              series.image!.smallUrl!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )
                          : const Icon(Icons.broken_image),
                      title: Text(series.name ?? 'Nom inconnu'),
                    );
                  },
                ),
              ElevatedButton(
                onPressed: _fetchSeries,
                child: const Text('Charger les séries'),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
