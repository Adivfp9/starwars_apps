import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:starwars_apps/models/species/species_detail_response.dart';
// import 'package:starwars_apps/models/species/species_detail_response.dart';
import 'package:starwars_apps/services/repository/api_services.dart';

final ApiServices _apiService = ApiServices();
final Dio _dio = Dio();

class SpeciesDetailProvider extends ChangeNotifier {
  bool isLoading = false;
  String? urlDetail,
      specAvgHeight = '',
      specavgLifespan = '',
      specClassification = '',
      specDesignation = '',
      specEyeColors = '',
      specHairColors = '',
      specHomeWorld = '',
      specLang = '',
      specName = '',
      specSkinColors = '',
      specId = '',
      imgSpec = '';
  List<String> specPeople = [];
  List<String> specFilms = [];

  SpeciesDetailProvider(urlDetail, specId) {
    print(specId);
    imgSpec = '${_apiService.imgSource + specId}.jpg';
    print(imgSpec);
    getSpecies(urlDetail!);
  }

  getSpecies(String urlDetail) async {
    isLoading = true;
    Response response = await _dio.get(urlDetail);
    if (response.statusCode == 200) {
      specName = response.data['name'];
      specavgLifespan = response.data['average_lifespan'];
      specClassification = response.data['classification'];
      specDesignation = response.data['designation'];
      specEyeColors = response.data['eye_colors'];
      specHairColors = response.data['hair_colors'];
      specHomeWorld = response.data['homeworld'];
      specLang = response.data['language'];
      specAvgHeight = response.data['average_height'];
      specSkinColors = response.data['skin_colors'];
    }
    isLoading = false;

    notifyListeners();
  }
}
