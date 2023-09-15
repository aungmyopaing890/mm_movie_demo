import 'package:flutter/material.dart';
import 'package:movie_demo/core/repository/movie_repository.dart';
import 'package:movie_demo/core/viewobject/movie_data.dart';

class NowPlayingMoviesProvider extends ChangeNotifier {
  NowPlayingMoviesProvider({
    required MovieRepository repository,
    int limit = 0,
  }) {
    _repository = repository;
  }

  MovieRepository? _repository;
  List<Movie> nowPlaylist = <Movie>[];
  MovieDataModel movieModel = MovieDataModel();
  bool isLoading = false;

  int page = 1;
  Future<void> loadDataList() async {
    isLoading = true;
    var dataMap = await _repository!.getNowPlaying(page: 1);
    movieModel = MovieDataModel.fromJson(dataMap);
    nowPlaylist.clear();
    nowPlaylist.addAll(movieModel.results!);
    isLoading = false;
    notifyListeners();
  }

  Future<void> loadNextDataList() async {
    isLoading = true;
    int totalPage = movieModel.totalPages ?? 0;
    if (page < totalPage) {
      page += 1;
      var dataMap = await _repository!.getNowPlaying(page: page);
      var data = MovieDataModel.fromJson(dataMap);
      nowPlaylist.addAll(data.results!);
    }
    isLoading = false;
    notifyListeners();
  }

  bool get hasData {
    return nowPlaylist.isEmpty ? false : true;
  }

  int get datalength {
    return nowPlaylist.length;
  }
}
