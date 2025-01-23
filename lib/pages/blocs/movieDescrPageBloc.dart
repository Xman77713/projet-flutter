// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_projet_final/api/comicVineAPI.dart';
// import 'package:flutter_projet_final/api/model/descr/responseAPIMovieDescr.dart';
// import 'package:flutter_projet_final/api/model/list/responseAPIMoviesList.dart';
// import 'package:flutter_projet_final/model/list/moviesListModel.dart';
//
// abstract class MovieDescrPageEvent {}
//
// class LoadDataMovieDescrEvent extends MovieDescrPageEvent {}
//
// class LoadDataMovieDescrBloc
//     extends Bloc<MovieDescrPageEvent, MovieDescrPageState> {
//   LoadDataMovieDescrBloc() : super(MovieDescrPageNotifierLoadingState()) {
//     on<LoadDataMovieDescrEvent>(_loadDataMovieDescr);
//     add(LoadDataMovieDescrEvent());
//   }
//
//   Future<void> _loadDataMovieDescr(MovieDescrPageEvent event,
//       Emitter<MovieDescrPageState> emit,) async {
//     try {
//       final OFFServerResponseMovieDescr responseMovieDescr =
//       await ComicVineAPIManager()
//           .getMovieDescr('793241465e20a2c4efd78bcfaa9df4356b780449');
//       emit(MoviesListPageNotifierSuccessState(
//           responseMovieDescr.get));
//     } catch (e) {
//       emit(MoviesListPageNotifierErrorState(e));
//     }
//   }
// }
//
// sealed class MovieDescrPageState {
//   get movieDescr => null;
// }
//
// class MovieDescrPageNotifierLoadingState extends MovieDescrPageState {}
//
// class MovieDescrPageNotifierSuccessState extends MovieDescrPageState {
//   final MovieDescrModel movieDescr;
//
//   MovieDescrPageNotifierSuccessState(this.movieDescr);
// }
//
// class MovieDescrPageNotifierErrorState extends MovieDescrPageState {
//   final dynamic error;
//
//   MovieDescrPageNotifierErrorState(this.error);
// }
