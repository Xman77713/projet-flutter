import 'package:dio/dio.dart';
import 'package:flutter_projet_final/api/model/responseAPI.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'comicVineAPI.g.dart';

@RestApi()
abstract class ComicVineAPI {
  factory ComicVineAPI(Dio dio, {required String baseUrl}) = _ComicVineAPI;

  @GET('/characters/')
  Future<OFFServerResponse> getCharacters(
    @Query('api_key') String apiKey,
    @Query('format') String format,
  );

  @GET('/character/{id}/')
  Future<OFFServerResponse> getCharacterDetails(
    @Path('id') String characterId,
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

  Future<dynamic> getCharacters(String apiKey) async {
    return api.getCharacters(apiKey, 'json');
  }

  Future<dynamic> getCharacterDetails(String id, String apiKey) async {
    return api.getCharacterDetails(id, apiKey, 'json');
  }
}

//series_list/APIkey&field_list=image,name
//baseUrl = https://api.comicvine.com
