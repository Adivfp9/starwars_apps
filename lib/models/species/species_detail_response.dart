class SpeciesDetailResponse {
  String? averageHeight;
  String? averageLifespan;
  String? classification;
  String? created;
  String? designation;
  String? edited;
  String? eyeColors;
  String? hairColors;
  String? homeworld;
  String? language;
  String? name;
  List<String>? people;
  List<String>? films;
  String? skinColors;
  String? url;

  SpeciesDetailResponse(
      {this.averageHeight,
      this.averageLifespan,
      this.classification,
      this.created,
      this.designation,
      this.edited,
      this.eyeColors,
      this.hairColors,
      this.homeworld,
      this.language,
      this.name,
      this.people,
      this.films,
      this.skinColors,
      this.url});

  SpeciesDetailResponse.fromJson(Map<String, dynamic> json) {
    averageHeight = json['average_height'];
    averageLifespan = json['average_lifespan'];
    classification = json['classification'];
    created = json['created'];
    designation = json['designation'];
    edited = json['edited'];
    eyeColors = json['eye_colors'];
    hairColors = json['hair_colors'];
    homeworld = json['homeworld'];
    language = json['language'];
    name = json['name'];
    people = json['people'].cast<String>();
    films = json['films'].cast<String>();
    skinColors = json['skin_colors'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['average_height'] = averageHeight;
    data['average_lifespan'] = averageLifespan;
    data['classification'] = classification;
    data['created'] = created;
    data['designation'] = designation;
    data['edited'] = edited;
    data['eye_colors'] = eyeColors;
    data['hair_colors'] = hairColors;
    data['homeworld'] = homeworld;
    data['language'] = language;
    data['name'] = name;
    data['people'] = people;
    data['films'] = films;
    data['skin_colors'] = skinColors;
    data['url'] = url;
    return data;
  }
}
