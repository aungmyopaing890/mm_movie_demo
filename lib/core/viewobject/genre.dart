// To parse this JSON data, do
//
//     final nowPlayingModel = nowPlayingModelFromJson(jsonString);

import 'dart:convert';

GenreDataModel genreModelFromJson(String str) =>
    GenreDataModel.fromJson(json.decode(str));

String genreModelToJson(GenreDataModel data) => json.encode(data.toJson());

class GenreDataModel {
  List<Genre>? genres;

  GenreDataModel({
    this.genres,
  });

  factory GenreDataModel.fromJson(Map<String, dynamic> json) => GenreDataModel(
        genres: json["genres"] == null
            ? []
            : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "genres": genres == null
            ? []
            : List<dynamic>.from(genres!.map((x) => x.toJson())),
      };
}

class Genre {
  int? id;
  String? name;

  Genre({
    this.id,
    this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
