import 'package:dio/dio.dart';
import 'package:flutter_projet_final/api/model/responseAPIIssuesList.dart';
import 'package:flutter_projet_final/api/model/responseAPIMoviesList.dart';
import 'package:flutter_projet_final/api/model/responseAPISerieDescr.dart';
import 'package:flutter_projet_final/api/model/responseAPISeriesList.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'comicVineAPI.g.dart';

@RestApi()
abstract class ComicVineAPI {
  factory ComicVineAPI(Dio dio, {required String baseUrl}) = _ComicVineAPI;

  @GET('/series_list/')
  Future<OFFServerResponseSeriesList> getSeries(
    @Query('api_key') String apiKey,
    @Query('format') String format,
  );

  @GET('/movies/')
  Future<OFFServerResponseMoviesList> getMovies(
    @Query('api_key') String apiKey,
    @Query('format') String format,
  );

  @GET('/issues/')
  Future<OFFServerResponseIssuesList> getIssues(
    @Query('api_key') String apiKey,
    @Query('format') String format,
  );

  @GET('/series/{id}/')
  Future<OFFServerResponseSerieDescr> getSerieDescr(
    @Query('api_key') String apiKey,
    @Query('format') String format,
    @Path('id') int id,
  );
}

class ComicVineAPIManager {
  static ComicVineAPIManager? _instance;

  factory ComicVineAPIManager() {
    _instance ??= ComicVineAPIManager._();
    return _instance!;
  }

  final ComicVineAPI api;

  ComicVineAPIManager._()
      : api = ComicVineAPI(
          Dio(),
          baseUrl: 'https://comicvine.gamespot.com/api',
        );

  Future<OFFServerResponseSeriesList> getSeries(String apiKey) async {
    return api.getSeries(apiKey, 'json');
  }

  Future<OFFServerResponseMoviesList> getMovies(String apiKey) async {
    return api.getMovies(apiKey, 'json');
  }

  Future<OFFServerResponseIssuesList> getIssues(String apiKey) async {
    return api.getIssues(apiKey, 'json');
  }

  Future<OFFServerResponseSerieDescr> getSerieDescr(
      String apiKey, int id) async {
    return api.getSerieDescr(apiKey, 'json', id);
  }
}
