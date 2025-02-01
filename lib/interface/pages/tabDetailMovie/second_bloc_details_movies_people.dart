import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projet_final/res/app_colors.dart';

import '../blocs/persoDetailMovieBloc.dart';

class SecondBlocDetailsMoviesPeople extends StatefulWidget {
  final List<int> listId;

  const SecondBlocDetailsMoviesPeople({super.key, required this.listId});

  @override
  State<SecondBlocDetailsMoviesPeople> createState() =>
      _FirstBlocDetailsMoviesState();
}

class _FirstBlocDetailsMoviesState
    extends State<SecondBlocDetailsMoviesPeople> {
  PersoDetailMoviePageState? state;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoadPersoDetailMovieBloc(widget.listId),
      child: BlocBuilder<LoadPersoDetailMovieBloc, PersoDetailMoviePageState>(
        builder: (BuildContext context, state) {
          return switch (state) {
            PersoDetailMoviePageNotifierLoadingState() => const Scaffold(
                body: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            PersoDetailMoviePageNotifierErrorState() => Scaffold(
                body: Center(
                  child: Text(
                    state.error.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            PersoDetailMoviePageNotifierSuccessState() => Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                padding: const EdgeInsets.all(14),
                child: Center(
                  child: Container(
                    width: double.infinity,
                    height: 700,
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                            state.characterDescrModel.listCharacterDescrModel
                                .length,
                            (index) => Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    state
                                            .characterDescrModel
                                            .listCharacterDescrModel[index]
                                            .characterDModel
                                            .getImageUrl()
                                            .smallUrl ??
                                        'Image indisponible',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  state
                                          .characterDescrModel
                                          .listCharacterDescrModel[index]
                                          .characterDModel
                                          .name ??
                                      'Nom indisponible',
                                  style: const TextStyle(
                                    color: AppColors.text,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          };
        },
      ),
    );
  }
}
