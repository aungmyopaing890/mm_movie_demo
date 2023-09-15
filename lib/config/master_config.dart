// ignore_for_file: constant_identifier_names

import 'package:intl/intl.dart';

class MasterConfig {
  MasterConfig._();

  ///
  /// AppVersion
  /// For your app, you need to change according based on your app version

  static const String app_version = '1.0';

  static const String api_token = '0ec4b3eea6d8e5cd187655ec504dae02';

  static const String app_db_name = 'movie_demo.db';

  //
  ///
  /// API URL
  /// Change your backend url
  ///
  static const String core_url = 'https://api.themoviedb.org/3';

  static const String app_url = '$core_url/api/v1/';
  static const String trending_url =
      "$core_url/trending/all/week?api_key=$api_token";
  static const String now_playing_url =
      "$core_url/movie/now_playing?api_key=$api_token";
  static const String popular_movie_url =
      "$core_url/movie/popular?api_key=$api_token";
  static const String genres_url =
      "$core_url/genre/movie/list?api_key=$api_token";
  static const String search_movie_url =
      "$core_url/search/movie?api_key=$api_token";
  static const String img_Url = "https://image.tmdb.org/t/p/original/";
  static const String back_drop_url = "https://image.tmdb.org/t/p/original/";

  ///
  /// Animation Duration
  ///
  static const Duration animation_duration = Duration(milliseconds: 500);

  static const String default_font_family = 'Kanit';
  static DateFormat dateFormat = DateFormat.yMMMd();
}
