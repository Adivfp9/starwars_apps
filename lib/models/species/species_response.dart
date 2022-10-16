import 'package:starwars_apps/models/species/species_result.dart';

class SpeciesResponse {
  int? count;
  String? next;
  String? previous;
  List<SpeciesResult>? results;

  SpeciesResponse({this.count, this.next, this.previous, this.results});

  SpeciesResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <SpeciesResult>[];
      json['results'].forEach((v) {
        results!.add(SpeciesResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
