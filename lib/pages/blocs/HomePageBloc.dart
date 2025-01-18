import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projet_final/api/comicVineAPI.dart';
import 'package:flutter_projet_final/api/model/list/responseAPIIssuesList.dart';
import 'package:flutter_projet_final/api/model/list/responseAPIMoviesList.dart';
import 'package:flutter_projet_final/api/model/list/responseAPISeriesList.dart';
import 'package:flutter_projet_final/model/list/issuesListModel.dart';
import 'package:flutter_projet_final/model/list/moviesListModel.dart';

import '../../model/list/seriesListModel.dart';

abstract class HomePageEvent {}

class LoadDataEvent extends HomePageEvent {}

class LoadDataBloc extends Bloc<HomePageEvent, HomePageState> {
  LoadDataBloc() : super(HomePageNotifierLoadingState()) {
    on<LoadDataEvent>(_loadDataList);
    add(LoadDataEvent());
  }

  Future<void> _loadDataList(
    HomePageEvent event,
    Emitter<HomePageState> emit,
  ) async {
    try {
      final OFFServerResponseSeriesList responseSeriesList =
          await ComicVineAPIManager()
              .getSeries('793241465e20a2c4efd78bcfaa9df4356b780449');
      final OFFServerResponseIssuesList responseIssuesList =
          await ComicVineAPIManager()
              .getIssues('793241465e20a2c4efd78bcfaa9df4356b780449');
      final OFFServerResponseMoviesList responseMoviesList =
          await ComicVineAPIManager()
              .getMovies('793241465e20a2c4efd78bcfaa9df4356b780449');
      emit(HomePageNotifierSuccessState(
          responseSeriesList.getSeriesListHP(),
          responseIssuesList.getIssuesListHP(),
          responseMoviesList.getMoviesListHP()));
    } catch (e) {
      emit(HomePageNotifierErrorState(e));
    }
  }
}

sealed class HomePageState {
  get seriesList => null;

  get issuesList => null;

  get moviesList => null;
}

class HomePageNotifierLoadingState extends HomePageState {}

class HomePageNotifierSuccessState extends HomePageState {
  final SeriesListModelHP seriesList;
  final IssuesListModelHP issuesList;
  final MoviesListModelHP moviesList;

  HomePageNotifierSuccessState(
      this.seriesList, this.issuesList, this.moviesList);
}

class HomePageNotifierErrorState extends HomePageState {
  final dynamic error;

  HomePageNotifierErrorState(this.error);
}
