import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projet_final/api/comicVineAPI.dart';
import 'package:flutter_projet_final/api/model/list/responseAPISeriesList.dart';

import '../../model/list/seriesListModel.dart';

abstract class SeriesListPageEvent {}

class LoadDataSeriesListEvent extends SeriesListPageEvent {}

class LoadDataSeriesListBloc
    extends Bloc<SeriesListPageEvent, SeriesListPageState> {
  LoadDataSeriesListBloc() : super(SeriesListPageNotifierLoadingState()) {
    on<LoadDataSeriesListEvent>(_loadDataSeriesList);
    add(LoadDataSeriesListEvent());
  }

  Future<void> _loadDataSeriesList(
    SeriesListPageEvent event,
    Emitter<SeriesListPageState> emit,
  ) async {
    try {
      final OFFServerResponseSeriesList responseSeriesList =
          await ComicVineAPIManager()
              .getSeries('793241465e20a2c4efd78bcfaa9df4356b780449', '100');
      emit(SeriesListPageNotifierSuccessState(
          responseSeriesList.getSeriesList()));
    } catch (e) {
      emit(SeriesListPageNotifierErrorState(e));
    }
  }
}

sealed class SeriesListPageState {
  get seriesList => null;
}

class SeriesListPageNotifierLoadingState extends SeriesListPageState {}

class SeriesListPageNotifierSuccessState extends SeriesListPageState {
  final SeriesListModel seriesList;

  SeriesListPageNotifierSuccessState(this.seriesList);
}

class SeriesListPageNotifierErrorState extends SeriesListPageState {
  final dynamic error;

  SeriesListPageNotifierErrorState(this.error);
}
