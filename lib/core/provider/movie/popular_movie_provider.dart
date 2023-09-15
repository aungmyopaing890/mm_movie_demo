import 'package:flutter/material.dart';
import 'package:movie_demo/core/repository/movie_repository.dart';
import 'package:movie_demo/core/viewobject/movie_data.dart';

class PopularMoviesProvider extends ChangeNotifier {
  PopularMoviesProvider({
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

  Future<void> loadDataList() async {
    isLoading = true;
    var dataMap = await _repository!.getPopularMovies(page: 1);
    moviesList.clear();
    moviesList.addAll(MovieDataModel.fromJson(dataMap).results!);
    isLoading = false;
    notifyListeners();
  }

  Future<void> loadNextDataList() async {
    isLoading = true;
    int totalPage = movieModel.totalPages ?? 0;
    if (page < totalPage) {
      page += 1;
      var dataMap = await _repository!.getPopularMovies(page: page);
      moviesList.addAll(MovieDataModel.fromJson(dataMap).results!);
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
