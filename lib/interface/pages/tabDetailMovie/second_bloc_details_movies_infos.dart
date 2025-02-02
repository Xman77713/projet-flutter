import 'package:flutter/material.dart';
import 'package:flutter_projet_final/interface/model/utils/producerModel.dart';
import 'package:flutter_projet_final/interface/model/utils/studioModel.dart';
import 'package:flutter_projet_final/interface/model/utils/writerModel.dart';
import 'package:flutter_projet_final/res/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

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
          height: 700,
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Classification
                  Row(
                    children: [
                      Text('Classification',
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                              color: AppColors.text,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )),
                      const SizedBox(width: 50),
                      Expanded(
                        child: Text(rating ?? 'Indisponible',
                            style: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                color: AppColors.text,
                                fontSize: 17,
                              ),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Réalisateur
                  Row(
                    children: [
                      Text('Réalisateur',
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                              color: AppColors.text,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )),
                      const SizedBox(width: 70),
                      Expanded(
                        child: Text(
                          'Indisponible',
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                                color: AppColors.text,
                                fontSize: 20,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Scénaristes
                  Row(
                    children: [
                      Text('Scénaristes',
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                              color: AppColors.text,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )),
                      const SizedBox(width: 50),
                      Expanded(
                        child: Column(
                          children: (writers?.listWritersModel.isEmpty == true)
                              ? [
                                  SizedBox(
                                    width: 150,
                                    child: Text(
                                      'Indisponible',
                                      style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                          color: AppColors.text,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  )
                                ]
                              : List.generate(
                                  writers!.listWritersModel.length,
                                  (index) => SizedBox(
                                    width: 150,
                                    child: Text(
                                      writers?.listWritersModel[index].name ??
                                          '',
                                      style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                            color: AppColors.text,
                                            fontSize: 20,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Producteurs
                  Row(
                    children: [
                      Text('Producteurs',
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                              color: AppColors.text,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )),
                      const SizedBox(width: 50),
                      Expanded(
                        child: Column(
                          children: (producers?.listProducersModel.isEmpty ==
                                  true)
                              ? [
                                  SizedBox(
                                    width: 150,
                                    child: Text(
                                      'Indisponible',
                                      style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                          color: AppColors.text,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  )
                                ]
                              : List.generate(
                                  producers!.listProducersModel.length,
                                  (index) => SizedBox(
                                    width: 150,
                                    child: Text(
                                      producers?.listProducersModel[index]
                                              .name ??
                                          '',
                                      style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                            color: AppColors.text,
                                            fontSize: 20,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Studios
                  Row(
                    children: [
                      Text('Studio',
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                              color: AppColors.text,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )),
                      const SizedBox(width: 101),
                      Expanded(
                        child: Column(
                          children: (studios?.listStudiosModel.isEmpty == true)
                              ? [
                                  SizedBox(
                                    width: 150,
                                    child: Text(
                                      'Indisponible',
                                      style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                          color: AppColors.text,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  )
                                ]
                              : List.generate(
                                  studios!.listStudiosModel.length,
                                  (index) => SizedBox(
                                    width: 150,
                                    child: Text(
                                      studios?.listStudiosModel[index].name ??
                                          '',
                                      style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                            color: AppColors.text,
                                            fontSize: 20,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Budget
                  Row(
                    children: [
                      Text('Budget',
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                              color: AppColors.text,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )),
                      const SizedBox(width: 110),
                      Expanded(
                        child: Text(
                          '${budget ?? 'XX'} \$',
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                                color: AppColors.text,
                                fontSize: 20,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Recette aux box-offices
                  Row(
                    children: [
                      Flexible(
                        child: Text('Recette aux box-offices',
                            style: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                color: AppColors.text,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            )),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          '${box_office_revenue ?? 'XX'} \$',
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                                color: AppColors.text,
                                fontSize: 20,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Recette brutes totales
                  Row(
                    children: [
                      Flexible(
                        child: Text('Recette brutes totales',
                            style: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                color: AppColors.text,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            )),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          '${total_revenue ?? 'XX'} \$',
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                                color: AppColors.text,
                                fontSize: 20,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
