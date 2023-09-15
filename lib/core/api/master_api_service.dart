import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../config/master_config.dart';

class MasterApiService {
  //* Get Trending Data----------------->

  Future<dynamic> getTrendingData() async {
    String url = MasterConfig.trending_url;
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var request = http.Request('GET', Uri.parse(url));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final http.Response res = await http.Response.fromStream(response);
    if (res.statusCode == 200) {
      final dynamic hashMap = json.decode(res.body);
      return hashMap;
    } else {
      return {};
    }
  }

  //* Get Now Playing Movies Data----------------->
  Future<dynamic> getNowPlaying({required int page}) async {
    String url = '${MasterConfig.now_playing_url}&page=$page';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var request = http.Request('GET', Uri.parse(url));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final http.Response res = await http.Response.fromStream(response);
    if (res.statusCode == 200) {
      final dynamic hashMap = json.decode(res.body);
      return hashMap;
    } else {
      return {};
    }
  }

  //* Get Popular Movies Data----------------->

  Future<dynamic> getPopularMovies({required int page}) async {
    String url = '${MasterConfig.popular_movie_url}&page=$page';

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var request = http.Request('GET', Uri.parse(url));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final http.Response res = await http.Response.fromStream(response);
    return json.decode(res.body);
  }

  //* Search Movies----------------->

  Future<dynamic> searchMovies(String query) async {
    String url = '${MasterConfig.search_movie_url}&query=$query';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var request = http.Request('GET', Uri.parse(url));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final http.Response res = await http.Response.fromStream(response);

    return json.decode(res.body);
  }

  //* Get Movie Details----------------->

  Future<dynamic> getMovieDetails(String id) async {
    String url =
        '${MasterConfig.core_url}/movie/$id?api_key=${MasterConfig.api_token}';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var request = http.Request('GET', Uri.parse(url));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final http.Response res = await http.Response.fromStream(response);
    return json.decode(res.body);
  }

  //* Get Genres----------------->
  Future<dynamic> getGenres() async {
    String url = MasterConfig.genres_url;
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var request = http.Request('GET', Uri.parse(url));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final http.Response res = await http.Response.fromStream(response);
    return json.decode(res.body);
  }
}
