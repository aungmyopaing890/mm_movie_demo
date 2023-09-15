import 'package:flutter/material.dart';
import 'package:movie_demo/core/repository/favourite_movies_repository.dart';
import 'package:movie_demo/core/viewobject/movie_data.dart';

class FavouriteMovieProvider extends ChangeNotifier {
  FavouriteMovieProvider({
    required FavouriteMovieRepository repository,
    int limit = 0,
  }) {
    _repository = repository;
  }

  FavouriteMovieRepository? _repository;
  List<Movie> favlist = <Movie>[];
  MovieDataModel movieModel = MovieDataModel();
  bool isLoading = false;

  bool isfav = false;

  int page = 1;
  Future<void> insert(Movie movie) async {
    isLoading = true;
    await _repository!.insert(movie);
    getByID(movie.id.toString());
    isLoading = false;
    notifyListeners();
  }

  Future<void> getByID(String id) async {
    isLoading = true;
    var data = await _repository!.get(id);
    isfav = data == null ? false : true;
    isLoading = false;
    notifyListeners();
  }

  bool get hasData {
    return favlist.isEmpty ? false : true;
  }

  int get datalength {
    return favlist.length;
  }
}
