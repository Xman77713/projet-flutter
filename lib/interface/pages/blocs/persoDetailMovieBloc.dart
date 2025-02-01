import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projet_final/api/comicVineAPI.dart';

import '../../model/utils/characterDescrModel.dart';

abstract class PersoDetailMovieEvent {}

class LoadPersoDetailMovieEvent extends PersoDetailMovieEvent {}

class LoadPersoDetailMovieBloc
    extends Bloc<PersoDetailMovieEvent, PersoDetailMoviePageState> {
  LoadPersoDetailMovieBloc(this.idList)
      : super(PersoDetailMoviePageNotifierLoadingState()) {
    on<LoadPersoDetailMovieEvent>(_loadPersoDetailMovieList);
    add(LoadPersoDetailMovieEvent());
  }

  final List<int> idList;

  Future<void> _loadPersoDetailMovieList(PersoDetailMovieEvent event,
      Emitter<PersoDetailMoviePageState> emit) async {
    try {
      final comicVineAPIManager = ComicVineAPIManager();

      final List<CharacterDescrModel> characters = await Future.wait(
        idList.map((id) async {
          final response = await comicVineAPIManager.getCharacterDescr(
              '793241465e20a2c4efd78bcfaa9df4356b780449', id);

          return response.getCharacterDescr();
        }),
      );

      emit(PersoDetailMoviePageNotifierSuccessState(
          ListCharacterDescrModel(characters)));
    } catch (e) {
      emit(PersoDetailMoviePageNotifierErrorState(e));
    }
  }
}

sealed class PersoDetailMoviePageState {
  get characterDescrModel => null;
}

class PersoDetailMoviePageNotifierLoadingState
    extends PersoDetailMoviePageState {}

class PersoDetailMoviePageNotifierSuccessState
    extends PersoDetailMoviePageState {
  final ListCharacterDescrModel characterDescrModel;

  PersoDetailMoviePageNotifierSuccessState(this.characterDescrModel);
}

class PersoDetailMoviePageNotifierErrorState extends PersoDetailMoviePageState {
  final dynamic error;

  PersoDetailMoviePageNotifierErrorState(this.error);
}
