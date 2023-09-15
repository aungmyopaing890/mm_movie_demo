import 'package:flutter/material.dart';
import 'package:movie_demo/core/repository/movie_repository.dart';
import 'package:movie_demo/core/viewobject/movie_data.dart';

class MovieDetailsProvider extends ChangeNotifier {
  MovieDetailsProvider({
    required MovieRepository repository,
    int limit = 0,
  }) {
    _repository = repository;
  }

  MovieRepository? _repository;
  Movie movie = Movie();
  MovieDataModel movieModel = MovieDataModel();
  bool isLoading = false;
  Future<void> loadData({required String id}) async {
    isLoading = true;
    var dataMap = await _repository!.getMovieDetails(id);
    movie = Movie.fromJson(dataMap);
    isLoading = false;
    notifyListeners();
  }
}
