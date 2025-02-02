import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projet_final/api/comicVineAPI.dart';
import 'package:flutter_projet_final/api/model/list/responseAPIMoviesList.dart';

import '../../model/list/moviesListModel.dart';

abstract class MoviesListPageEvent {}

class LoadDataMoviesListEvent extends MoviesListPageEvent {}

class LoadDataMoviesListBloc
    extends Bloc<MoviesListPageEvent, MoviesListPageState> {
  LoadDataMoviesListBloc() : super(MoviesListPageNotifierLoadingState()) {
    on<LoadDataMoviesListEvent>(_loadDataMoviesList);
    add(LoadDataMoviesListEvent());
  }

  Future<void> _loadDataMoviesList(
    MoviesListPageEvent event,
    Emitter<MoviesListPageState> emit,
  ) async {
    try {
      final OFFServerResponseMoviesList responseMoviesList =
          await ComicVineAPIManager()
              .getMovies('793241465e20a2c4efd78bcfaa9df4356b780449', '100');
      emit(MoviesListPageNotifierSuccessState(
          responseMoviesList.getMoviesList()));
    } catch (e) {
      emit(MoviesListPageNotifierErrorState(e));
    }
  }
}

sealed class MoviesListPageState {
  get moviesList => null;
}

class MoviesListPageNotifierLoadingState extends MoviesListPageState {}

class MoviesListPageNotifierSuccessState extends MoviesListPageState {
  final MoviesListModel moviesList;

  MoviesListPageNotifierSuccessState(this.moviesList);
}

class MoviesListPageNotifierErrorState extends MoviesListPageState {
  final dynamic error;

  MoviesListPageNotifierErrorState(this.error);
}
