import 'package:starwars_apps/models/species/species_response.dart';
import 'package:starwars_apps/models/species/species_result.dart';
import 'package:starwars_apps/services/repository/api_services.dart';
import 'package:flutter/material.dart';

final ApiServices _apiService = ApiServices();

class SpeciesProvider extends ChangeNotifier {
  ScrollController? scrollController;
  bool isLoading = false, hasMoreData = true;
  int currentPage = 1, activePage = 1, totalPages = 0;
  String? nextPage = '';
  String? imgSource = '';
  List<SpeciesResult> speciesList = [];
  List tmpList = [];

  SpeciesProvider() {
    imgSource = _apiService.imgSource;
    getInisialData(activePage);
    scrollController = ScrollController();
    scrollController!.addListener(_scrollListener);
  }

  getInisialData(activePage) async {
    isLoading = true;
    SpeciesResponse response = await _apiService.getAllSpecies(activePage);
    totalPages = (response.count! / 10).ceil();
    if (response.next != null && response.next != '') {
      hasMoreData = true;
    } else {
      hasMoreData = false;
    }
    List<SpeciesResult>? species = response.results;
    speciesList.addAll(species!);
    isLoading = false;
    notifyListeners();
  }

  _scrollListener() {
    if (scrollController!.position.pixels ==
        scrollController!.position.maxScrollExtent) {
      nextPage = "";
      if (hasMoreData) {
        activePage++;
        isLoading = true;
        getInisialData(activePage);
      } else {
        activePage = totalPages;
        isLoading = false;
        nextPage = "No More Data";
      }
    }
    if (scrollController!.offset <=
            scrollController!.position.minScrollExtent &&
        scrollController!.position.outOfRange) {
      isLoading = false;
      nextPage = "";
      hasMoreData = false;
    }
    notifyListeners();
  }
}
