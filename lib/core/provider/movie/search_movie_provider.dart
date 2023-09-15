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
  List<Movie> moviesList = <Movie>[];
  MovieDataModel movieModel = MovieDataModel();
  bool isLoading = false;
  int page = 1;

  Future<void> searchMovies(String quety) async {
    isLoading = true;
    var dataMap = await _repository!.searchMovies(quety, 1);
    movieModel = MovieDataModel.fromJson(dataMap);
    moviesList.clear();
    moviesList.addAll(movieModel.results!);
    isLoading = false;
    notifyListeners();
  }

  Future<void> loadNextDataList(String quety) async {
    isLoading = true;
    int totalPage = movieModel.totalPages ?? 0;
    if (page < totalPage) {
      page += 1;
      var dataMap = await _repository!.searchMovies(quety, 1);
      movieModel = MovieDataModel.fromJson(dataMap);
      moviesList.addAll(movieModel.results!);
    }
    isLoading = false;
    notifyListeners();
  }

  bool get hasData {
    return moviesList.isEmpty ? false : true;
  }

  int get datalength {
    return moviesList.length;
  }
}
