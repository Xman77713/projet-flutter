import 'package:dio/dio.dart';
import 'package:flutter_projet_final/api/model/descr/responseAPIMovieDescr.dart';
import 'package:flutter_projet_final/api/model/descr/responseAPISerieDescr.dart';
import 'package:flutter_projet_final/api/model/list/responseAPIIssuesList.dart';
import 'package:flutter_projet_final/api/model/list/responseAPIMoviesList.dart';
import 'package:flutter_projet_final/api/model/list/responseAPISeriesList.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import 'model/descr/responseAPICharacterDescr.dart';
import 'model/descr/responseAPIIssueDescr.dart';
import 'model/descr/responseAPIPersonDescr.dart';

part 'comicVineAPI.g.dart';

@RestApi()
abstract class ComicVineAPI {
  factory ComicVineAPI(Dio dio, {required String baseUrl}) = _ComicVineAPI;

  @GET('/series_list/')
  Future<OFFServerResponseSeriesList> getSeries(
    @Query('api_key') String apiKey,
    @Query('format') String format,
    @Query('limit') String limit,
  );

  @GET('/movies/')
  Future<OFFServerResponseMoviesList> getMovies(
    @Query('api_key') String apiKey,
    @Query('format') String format,
    @Query('limit') String limit,
  );

  @GET('/issues/')
  Future<OFFServerResponseIssuesList> getIssues(
    @Query('api_key') String apiKey,
    @Query('format') String format,
    @Query('limit') String limit,
  );

  @GET('/series/{id}/')
  Future<OFFServerResponseSerieDescr> getSerieDescr(
    @Query('api_key') String apiKey,
    @Query('format') String format,
    @Path('id') int id,
  );

  @GET('/movie/4025-{id}/')
  Future<OFFServerResponseMovieDescr> getMovieDescr(
    @Query('api_key') String apiKey,
    @Query('format') String format,
    @Path('id') int id,
  );

  @GET('/issue/4000-{id}/')
  Future<OFFServerResponseIssueDescr> getIssueDescr(
    @Query('api_key') String apiKey,
    @Query('format') String format,
    @Path('id') int id,
  );

  @GET('/person/4040-{id}/')
  Future<OFFServerResponsePersonDescr> getPersonDescr(
    @Query('api_key') String apiKey,
    @Query('format') String format,
    @Path('id') int id,
  );

  @GET('/character/4005-{id}/')
  Future<OFFServerResponseCharacterDescr> getCharacterDescr(
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

  Future<OFFServerResponseSeriesList> getSeries(
      String apiKey, String limit) async {
    return api.getSeries(apiKey, 'json', limit);
  }

  Future<OFFServerResponseMoviesList> getMovies(
      String apiKey, String limit) async {
    return api.getMovies(apiKey, 'json', limit);
  }

  Future<OFFServerResponseIssuesList> getIssues(
      String apiKey, String? limit) async {
    return api.getIssues(apiKey, 'json', limit!);
  }

  Future<OFFServerResponseSerieDescr> getSerieDescr(
      String apiKey, int id) async {
    return api.getSerieDescr(apiKey, 'json', id);
  }

  Future<OFFServerResponseMovieDescr> getMovieDescr(
      String apiKey, int id) async {
    return api.getMovieDescr(apiKey, 'json', id);
  }

  Future<OFFServerResponseIssueDescr> getIssueDescr(
      String apiKey, int id) async {
    return api.getIssueDescr(apiKey, 'json', id);
  }

  Future<OFFServerResponsePersonDescr> getPersonDescr(
      String apiKey, int id) async {
    return api.getPersonDescr(apiKey, 'json', id);
  }

  Future<OFFServerResponseCharacterDescr> getCharacterDescr(
      String apiKey, int id) async {
    return api.getCharacterDescr(apiKey, 'json', id);
  }
}
