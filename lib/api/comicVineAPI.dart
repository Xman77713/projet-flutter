import 'package:dio/dio.dart';
import 'package:flutter_projet_final/api/model/responseAPISeriesList.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'comicVineAPI.g.dart';

@RestApi()
abstract class ComicVineAPI {
  factory ComicVineAPI(Dio dio, {required String baseUrl}) = _ComicVineAPI;

  @GET('/series_list/')
  Future<OFFServerResponse> getSeries(
    @Query('api_key') String apiKey,
    @Query('format') String format,
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

  Future<OFFServerResponse> getSeries(String apiKey) async {
    return api.getSeries(apiKey, 'json');
  }
}
