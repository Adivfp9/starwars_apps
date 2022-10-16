import 'package:dio/dio.dart';
import 'package:starwars_apps/models/species/species_response.dart';

class ApiServices {
  final String endpoint = "https://swapi.dev/api/";
  final String apiKey = "";
  final Dio _dio = Dio();

  Future<SpeciesResponse> getAllSpecies(int page) async {
    // page = page == 0 ? page = 1 : page;
    // print("hal ${page.toString()}'");

    try {
      Response response =
          await _dio.get('${endpoint}species/?page=${page.toString()}');
      // Response response = await _dio.get('${endpoint}species/');
      print(response.data);
      return SpeciesResponse.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        throw Exception("Connection Timeout Exception");
      }
      throw Exception(ex.message);
    }
  }
}
