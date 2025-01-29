import 'package:flutter/material.dart';
import 'package:flutter_projet_final/interface/model/utils/producerModel.dart';
import 'package:flutter_projet_final/interface/model/utils/studioModel.dart';
import 'package:flutter_projet_final/interface/model/utils/writerModel.dart';

class SecondBlocDetailsMoviesInfos extends StatelessWidget {
  final ListProducersModel? producers;
  final ListStudiosModel? studios;
  final String? budget;
  final String? box_office_revenue;
  final String? rating;
  final ListWritersModel? writers;
  final String? total_revenue;

  const SecondBlocDetailsMoviesInfos(
      {super.key,
      required this.producers,
      required this.studios,
      required this.budget,
      required this.box_office_revenue,
      required this.rating,
      required this.writers,
      required this.total_revenue});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.all(14),
      child: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 26, 49, 73),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Classification
                  Row(
                    children: [
                      const Text(
                        'Classification',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        rating ?? 'Indisponible',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Réalisateur
                  const Row(
                    children: [
                      Text(
                        'Réalisateur',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Indiponible',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Scénaristes
                  Row(
                    children: [
                      const Text(
                        'Scénaristes',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          writers!.listWritersModel.length,
                          (index) => SizedBox(
                            width: 150,
                            child: Text(
                              writers?.listWritersModel[index].name ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Producteurs
                  Row(
                    children: [
                      const Text(
                        'Producteurs',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            producers!.listProducersModel.length,
                            (index) => Text(
                              producers?.listProducersModel[index].name ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Studio
                  Row(
                    children: [
                      const Text(
                        'Studio',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            studios!.listStudiosModel.length,
                            (index) => Text(
                              studios?.listStudiosModel[index].name ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text(
                        'Budget',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${budget ?? 'XX'} \$',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Flexible(
                        child: Text(
                          'Recette aux box-offices',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${box_office_revenue ?? 'XX'} \$',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              overflow: TextOverflow.ellipsis,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Flexible(
                        child: Text(
                          'Recette brutes totales',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${total_revenue ?? 'XX'} \$',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              overflow: TextOverflow.ellipsis,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
