import 'package:flutter_projet_final/api/model/responseAPIImageURL.dart';
import 'package:json_annotation/json_annotation.dart';

part 'responseAPIIssuesList.g.dart';

@JsonSerializable()
class OFFServerResponseIssuesList {
  @JsonKey(name: 'results')
  final List<OFFIssues>? results;
  @JsonKey(name: 'error')
  final String? error;

  OFFServerResponseIssuesList(this.results, this.error);

  factory OFFServerResponseIssuesList.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseIssuesListFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseIssuesListToJson(this);
}

@JsonSerializable()
class OFFIssues {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'image')
  final ImageURL? image;
  @JsonKey(name: 'id')
  final int? id;

  OFFIssues(this.name, this.image, this.id);

  factory OFFIssues.fromJson(Map<String, dynamic> json) =>
      _$OFFIssuesFromJson(json);

  Map<String, dynamic> toJson() => _$OFFIssuesToJson(this);
}
