import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projet_final/pages/blocs/seriesPageBloc.dart';
import 'package:flutter_projet_final/pages/card_series.dart';
import 'package:flutter_projet_final/res/app_colors.dart';

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
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
              SeriesListPageNotifierSuccessState() => Scaffold(
                  backgroundColor: AppColors.grey2,
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: const EdgeInsets.only(top: 40),
                            padding: const EdgeInsets.all(16.0),
                            child: const Text(
                              'Séries les plus populaires',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: 700, //TODO à changer (peut-être)
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
