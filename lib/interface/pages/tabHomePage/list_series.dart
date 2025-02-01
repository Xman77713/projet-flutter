import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projet_final/res/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/seriesPageBloc.dart';
import '../card/card_series.dart';

class ListSeries extends StatefulWidget {
  const ListSeries({super.key});

  @override
  State<ListSeries> createState() => _ListSeriesState();
}

class _ListSeriesState extends State<ListSeries> {
  SeriesListPageState? state;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => LoadDataSeriesListBloc(),
        child: BlocBuilder<LoadDataSeriesListBloc, SeriesListPageState>(
          builder: (BuildContext context, state) {
            return switch (state) {
              SeriesListPageNotifierLoadingState() => const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ),
              SeriesListPageNotifierErrorState() => Scaffold(
                  body: Center(
                    child: Text(state.error.toString(),
                        style: const TextStyle(color: AppColors.text)),
                  ),
                ),
              SeriesListPageNotifierSuccessState() => Scaffold(
                  backgroundColor: AppColors.screenBackground,
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          child: Container(
                            margin: const EdgeInsets.only(top: 30, left: 32),
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Séries les plus populaires',
                              style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                  color: AppColors.text,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: List.generate(
                                    100,
                                    (index) => Padding(
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      child: CardSeries(
                                        serie: state
                                            .seriesList.seriesListModel[index],
                                        index: index + 1,
                                      ),
                                    ),
                                  ),
                                ))),
                      ],
                    ),
                  ),
                )
            };
          },
        ));
  }
}
