import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';

part 'comicVineAPI.g.dart';

@JsonSerializable()
class ListOfSeriesResponse {
  @JsonKey(name: 'name')
  final int name;

  ListOfSeriesResponse(this.name);

  factory ListOfSeriesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListOfSeriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListOfSeriesResponseToJson(this);

  @override
  String toString() {
    return 'ProductResponse{name: $name}';
  }
}

@RestApi()
abstract class ComicVineAPI {
  factory ComicVineAPI(Dio dio, {required String baseUrl}) = _ComicVineAPI;

  @GET('/series_list/793241465e20a2c4efd78bcfaa9df4356b780449')
  Future<Json> getListOfSeries(
      {@Query('image') required String barcode,
      @Query('name') required String barcode});
}

//series_list/APIkey&field_list=image,name
//baseUrl = https://api.comicvine.com
