import '../utils/imageUrlModel.dart';
import '../utils/nameComicsModel.dart';

class IssuesListModel {
  final List<IssueModel> issuesListModel;

  IssuesListModel(this.issuesListModel);
}

class IssueModel {
  final NameComicsModel? name;
  final ImageUrlModel? image;
  final int? id;
  final String? issue_number;
  final DateTime? date_added;
  final String? nameSaga;

  IssueModel(this.name, this.image, this.id, this.issue_number, this.date_added,
      this.nameSaga);
}

class IssuesListModelHP {
  final List<IssueModelHP> issuesListModelHP;

  IssuesListModelHP(this.issuesListModelHP);
}

class IssueModelHP {
  final NameComicsModel? name;
  final ImageUrlModel? image;

  IssueModelHP(this.name, this.image);
}
