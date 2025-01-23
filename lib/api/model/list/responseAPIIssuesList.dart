import 'package:flutter_projet_final/api/model/utils/responseAPIImageURL.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../interface/model/list/issuesListModel.dart';
import '../utils/responseAPINameComics.dart';

part 'responseAPIIssuesList.g.dart';

@JsonSerializable()
class OFFServerResponseIssuesList {
  @JsonKey(name: 'results')
  final List<OFFIssues> results;
  @JsonKey(name: 'error')
  final String error;

  OFFServerResponseIssuesList(this.results, this.error);

  factory OFFServerResponseIssuesList.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseIssuesListFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseIssuesListToJson(this);

  IssuesListModel getIssuesList() =>
      IssuesListModel(results.map((issue) => issue.getIssue()).toList());

  IssuesListModelHP getIssuesListHP() =>
      IssuesListModelHP(results.map((issue) => issue.getIssueHP()).toList());
}

@JsonSerializable()
class OFFIssues {
  @JsonKey(name: 'volume')
  final NameComics? name;
  @JsonKey(name: 'image')
  final ImageURL? image;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'issue_number')
  final String? issue_number;
  @JsonKey(name: 'date_added')
  final DateTime? date_added;
  @JsonKey(name: 'name')
  final String? nameSaga;

  OFFIssues(this.name, this.image, this.id, this.issue_number, this.date_added,
      this.nameSaga);

  factory OFFIssues.fromJson(Map<String, dynamic> json) =>
      _$OFFIssuesFromJson(json);

  Map<String, dynamic> toJson() => _$OFFIssuesToJson(this);

  IssueModel getIssue() => IssueModel(name?.getNameComics(),
      image?.getImageUrl(), id, issue_number, date_added, nameSaga);

  IssueModelHP getIssueHP() =>
      IssueModelHP(name?.getNameComics(), image?.getImageUrl());
}
