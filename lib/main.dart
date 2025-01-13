import 'package:flutter/material.dart';
import 'package:flutter_projet_final/api/comicVineAPI.dart';
import 'package:flutter_projet_final/api/model/descr/responseAPIPersonDescr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Détails de la Personne',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PersonDetailsPage(personId: 1251),
    );
  }
}

class PersonDetailsPage extends StatefulWidget {
  final int personId;

  const PersonDetailsPage({Key? key, required this.personId}) : super(key: key);

  @override
  State<PersonDetailsPage> createState() => _PersonDetailsPageState();
}

class _PersonDetailsPageState extends State<PersonDetailsPage> {
  final ComicVineAPIManager apiManager = ComicVineAPIManager();
  OFFPersonDescr? _personDetails;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _fetchPersonDetails(widget.personId);
  }

  Future<void> _fetchPersonDetails(int id) async {
    try {
      final response = await apiManager.getPersonDescr(
          '793241465e20a2c4efd78bcfaa9df4356b780449', id);
      setState(() {
        _personDetails = response.results;
      });
    } catch (e) {
      setState(() {
        _error = 'Erreur lors de la récupération des détails : $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails de la Personne'),
      ),
      body: Center(
        child: _error.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _error,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              )
            : _personDetails != null
                ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (_personDetails!.image != null) ...[
                            Center(
                              child: Image.network(
                                _personDetails!.image!.smallUrl ?? '',
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Small URL : ${_personDetails!.image!.smallUrl ?? "Non disponible"}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Medium URL : ${_personDetails!.image!.mediumUrl ?? "Non disponible"}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                          const SizedBox(height: 16),
                          Text(
                            _personDetails!.name ?? 'Nom inconnu',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'ID : ${_personDetails!.id ?? "Inconnu"}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  )
                : const CircularProgressIndicator(),
      ),
    );
  }
}
