import 'package:flutter/material.dart';
import 'package:movie_demo/core/repository/movie_repository.dart';
import 'package:movie_demo/core/viewobject/movie_data.dart';

class SearchMovieProvider extends ChangeNotifier {
  SearchMovieProvider({
    required MovieRepository repository,
    int limit = 0,
  }) {
    _repository = repository;
  }

  MovieRepository? _repository;
  List<Movie> nowPlaylist = <Movie>[];
  MovieDataModel nowPlayingModel = MovieDataModel();
  bool isLoading = false;
  Future<void> searchMovies(String quety) async {
    isLoading = true;
    var dataMap = await _repository!.searchMovies(quety);
    var data = MovieDataModel.fromJson(dataMap);
    nowPlaylist.clear();
    nowPlaylist.addAll(data.results!);
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
