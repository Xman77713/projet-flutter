import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projet_final/api/comicVineAPI.dart';
import 'package:flutter_projet_final/api/model/list/responseAPISeriesList.dart';

import '../model/list/seriesListModel.dart';

abstract class SeriesListEvent {}

class LoadProductEvent extends SeriesListEvent {}

class SeriesListBloc extends Bloc<SeriesListEvent, SeriesListState> {
  SeriesListBloc() : super(ProductNotifierLoadingState()) {
    on<LoadProductEvent>(_loadSeriesList);
    add(LoadProductEvent());
  }

  Future<void> _loadSeriesList(
    SeriesListEvent event,
    Emitter<SeriesListState> emit,
  ) async {
    try {
      final OFFServerResponseSeriesList response = await ComicVineAPIManager()
          .getSeries('793241465e20a2c4efd78bcfaa9df4356b780449');
      emit(SeriesListNotifierSuccessState(response.getSeriesList()));
    } catch (e) {
      emit(SeriesListNotifierErrorState(e));
    }
  }
}

sealed class SeriesListState {
  get seriesList => null;
}

class ProductNotifierLoadingState extends SeriesListState {}

class SeriesListNotifierSuccessState extends SeriesListState {
  final SeriesListModel seriesList;

  SeriesListNotifierSuccessState(this.seriesList);
}

class SeriesListNotifierErrorState extends SeriesListState {
  final dynamic error;

  SeriesListNotifierErrorState(this.error);
}
