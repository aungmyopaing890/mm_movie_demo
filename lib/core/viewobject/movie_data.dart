// To parse this JSON data, do
//
//     final nowPlayingModel = nowPlayingModelFromJson(jsonString);

import 'dart:convert';

MovieDataModel nowPlayingModelFromJson(String str) =>
    MovieDataModel.fromJson(json.decode(str));

String nowPlayingModelToJson(MovieDataModel data) => json.encode(data.toJson());

class MovieDataModel {
  Dates? dates;
  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalNowPlayDatas;

  MovieDataModel({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalNowPlayDatas,
  });

  factory MovieDataModel.fromJson(Map<String, dynamic> json) => MovieDataModel(
        dates: json["dates"] == null ? null : Dates.fromJson(json["dates"]),
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<Movie>.from(json["results"]!.map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalNowPlayDatas: json["total_NowPlayDatas"],
      );

  Map<String, dynamic> toJson() => {
        "dates": dates?.toJson(),
        "page": page,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_NowPlayDatas": totalNowPlayDatas,
      };
}

class Dates {
  DateTime? maximum;
  DateTime? minimum;

  Dates({
    this.maximum,
    this.minimum,
  });

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum:
            json["maximum"] == null ? null : DateTime.parse(json["maximum"]),
        minimum:
            json["minimum"] == null ? null : DateTime.parse(json["minimum"]),
      );

  Map<String, dynamic> toJson() => {
        "maximum":
            "${maximum!.year.toString().padLeft(4, '0')}-${maximum!.month.toString().padLeft(2, '0')}-${maximum!.day.toString().padLeft(2, '0')}",
        "minimum":
            "${minimum!.year.toString().padLeft(4, '0')}-${minimum!.month.toString().padLeft(2, '0')}-${minimum!.day.toString().padLeft(2, '0')}",
      };
}

class Movie {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json["adult"], //
      backdropPath: json["backdrop_path"],
      genreIds: json["genre_ids"] == null
          ? []
          : List<int>.from(json["genre_ids"]!.map((x) => x)),
      id: json["id"],
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      popularity: json["popularity"]?.toDouble(), //
      posterPath: json["poster_path"],
      releaseDate: json["release_date"] == "" || json["release_date"] == null
          ? null
          : DateTime.parse(json["release_date"]),
      title: json["title"],
      video: json["video"],
      voteAverage: json["vote_average"]?.toDouble(), //
      voteCount: json["vote_count"],
    );
  }

  Map<String, dynamic> toJson() => {
        "adult": 1,
        "backdrop_path": backdropPath,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

const String tableMovie = 'movies';

class MovieFields {
  static final List<String> values = [
    id,
    posterPath,
    title,
    voteAverage,
  ];

  static const String id = 'id';
  static const String posterPath = 'poster_path';
  static const String title = 'title';
  static const String voteAverage = 'vote_average';
}
