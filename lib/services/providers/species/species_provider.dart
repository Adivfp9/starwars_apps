// import 'package:starwars_apps/models/species/species_response.dart';
// import 'package:starwars_apps/models/species/species_result.dart';
// import 'package:starwars_apps/services/repository/api_services.dart';
// import 'package:flutter/material.dart';

// final ApiServices _apiService = ApiServices();

// enum DataState {
//   Uninitialized,
//   Refreshing,
//   Initial_Fetching,
//   More_Fetching,
//   Fetched,
//   No_More_Data,
//   Error
// }

// class SpeciesProvider2 extends ChangeNotifier {
//   bool isLoading = false, isRefresh = false;
//   String apiUrl = '', msgScroll = '';
//   int _currentPageNumber = 0;
//   int _totalPages = 999;
//   int totalData = 0;
//   ScrollNotification? scrollCtrl;
//   bool get _didLastLoad => _currentPageNumber > _totalPages;
//   DataState _dataState = DataState.Uninitialized;
//   DataState get dataState => _dataState;
//   List<SpeciesResult> speciesList = [];

//   // SpeciesProvider2() {
//   //   _dataState = DataState.Uninitialized;
//   //   fetchData(isRefresh: true);
//   //   // scrollCtrl = ScrollController();
//   //   // scrollCtrl?.addListener(scrollListener);
//   // }

//   // nextPage() {
//   //   if (_currentPageNumber < _totalPages) {
//   //     _currentPageNumber += 1;
//   //   }
//   // }

//   fetchData({bool isRefresh = false}) async {
//     if (!isRefresh) {
//       _dataState = (_dataState == DataState.Uninitialized)
//           ? DataState.Initial_Fetching
//           : DataState.More_Fetching;
//     } else {
//       speciesList.clear();
//       _currentPageNumber = 0;
//       _dataState = DataState.Refreshing;
//     }
//     notifyListeners();

//     try {
//       if (_didLastLoad) {
//         _dataState = DataState.No_More_Data;
//       } else {
//         SpeciesResponse response =
//             await _apiService.getAllSpecies(_currentPageNumber);
//         _totalPages = response.count!.ceil();
//         totalData = response.count!;
//         List<SpeciesResult>? species = response.results;
//         if (_dataState == DataState.Refreshing) {
//           speciesList.clear();
//         }
//         speciesList += species!.toList();
//         _dataState = DataState.Fetched;
//         _currentPageNumber += 1;
//       }
//       notifyListeners();
//       // if (currentPageNumber < totalPages!) {
//       //   currentPageNumber += 1;
//       // }
//     } catch (e) {
//       _dataState = DataState.Error;
//       notifyListeners();
//       // } on DioError catch (ex) {
//       //   if (ex.type == DioErrorType.connectTimeout) {
//       //     throw Exception("Connection Timeout Exception");
//       //   }
//       //   throw Exception(ex.message);
//     }
//   }

//   // scrollListener() {
//   //   if (scrollCtrl?.position.maxScrollExtent != null) {
//   //     print(currentPageNumber);
//   //     print(totalPages);
//   //     if (currentPageNumber < totalPages!) {
//   //       currentPageNumber += 1;
//   //       fetchData();
//   //     }
//   //   }
//   //   // if (scrollCtrl!.offset <= scrollCtrl!.position.minScrollExtent &&
//   //   //     !scrollCtrl!.position.outOfRange) {
//   //   //   currentPageNumber = totalPages!;
//   //   // }

//   //   notifyListeners();
//   // }

//   bool scrollNotification(ScrollNotification scrollCtrl) {
//     if (!isLoading &&
//         scrollCtrl.metrics.pixels == scrollCtrl.metrics.maxScrollExtent) {
//       isLoading = true;
//       fetchData();
//       notifyListeners();
//     }
//     return true;
//   }

//   onRefresh() async {
//     if (!isLoading) {
//       isLoading = true;
//       fetchData(isRefresh: true);
//       notifyListeners();
//     }
//   }
// }
