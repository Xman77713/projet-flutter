import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projet_final/api/comicVineAPI.dart';
import 'package:flutter_projet_final/api/model/list/responseAPIIssuesList.dart';
import 'package:flutter_projet_final/model/list/issuesListModel.dart';

abstract class IssuesListPageEvent {}

class LoadDataIssuesListEvent extends IssuesListPageEvent {}

class LoadDataIssuesListBloc
    extends Bloc<IssuesListPageEvent, IssuesListPageState> {
  LoadDataIssuesListBloc() : super(IssuesListPageNotifierLoadingState()) {
    on<LoadDataIssuesListEvent>(_loadDataIssuesList);
    add(LoadDataIssuesListEvent());
  }

  Future<void> _loadDataIssuesList(
    IssuesListPageEvent event,
    Emitter<IssuesListPageState> emit,
  ) async {
    try {
      final OFFServerResponseIssuesList responseIssuesList =
          await ComicVineAPIManager()
              .getIssues('793241465e20a2c4efd78bcfaa9df4356b780449');
      emit(IssuesListPageNotifierSuccessState(
          responseIssuesList.getIssuesList()));
    } catch (e) {
      emit(IssuesListPageNotifierErrorState(e));
    }
  }
}

sealed class IssuesListPageState {
  get issuesList => null;
}

class IssuesListPageNotifierLoadingState extends IssuesListPageState {}

class IssuesListPageNotifierSuccessState extends IssuesListPageState {
  final IssuesListModel issuesList;

  IssuesListPageNotifierSuccessState(this.issuesList);
}

class IssuesListPageNotifierErrorState extends IssuesListPageState {
  final dynamic error;

  IssuesListPageNotifierErrorState(this.error);
}
