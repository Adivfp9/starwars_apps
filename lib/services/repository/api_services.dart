import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:starwars_apps/models/species/species_detail_response.dart';
import 'package:starwars_apps/models/species/species_response.dart';

class ApiServices {
  final String imgSource =
      "https://starwars-visualguide.com/assets/img/species/";
  final String endpoint = "https://swapi.dev/api/";
  final String apiKey = "";
  Dio _dio = Dio();

  /// Initialize constructors
  ApiServices({Dio? dio}) {
    _dio = dio ?? Dio();
    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
      ));
    }
  }

  Future<SpeciesResponse> getAllSpecies(int page) async {
    // page = page == 0 ? page = 1 : page;
    // print("hal ${page.toString()}'");

    try {
      Response response =
          await _dio.get('${endpoint}species/?page=${page.toString()}');
      if (response.statusCode == 404) {
        throw Exception("No more data");
      } else {
        return SpeciesResponse.fromJson(response.data);
      }
      // Response response = await _dio.get('${endpoint}species/');
      // print(response.data);
    } catch (e) {
      return SpeciesResponse.withError("No more data");
    }
    // } on DioError catch (ex) {
    //   if (ex.type == DioErrorType.connectTimeout) {
    //     throw Exception("Connection Timeout Exception");
    //   }
    //   throw Exception(ex.message);
    // }
  }

  getDetailSpecies(String url) async {
    try {
      Response response = await _dio.get(url);

      return response.data;
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        throw Exception("Connection Timeout Exception");
      }
      throw Exception(ex.message);
    }
  }
}
