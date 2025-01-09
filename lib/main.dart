import 'package:flutter/material.dart';
import 'api/comicVineAPI.dart';

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
  String _apiResult = 'Appuie sur un bouton pour tester l\'API.';

  Future<void> _fetchCharacters() async {
    setState(() {
      _apiResult = 'Chargement les series';
    });
    try {
      final response = await apiManager
          .getSeries('793241465e20a2c4efd78bcfaa9df4356b780449');
      setState(() {
        _apiResult = response.toString();
      });
    } catch (e) {
      setState(() {
        _apiResult = 'Erreur : $e';
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _apiResult,
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: _fetchCharacters,
                child: const Text('Charger les séries'),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
