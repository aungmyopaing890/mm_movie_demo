import 'package:movie_demo/core/viewobject/movie_data.dart';

import '../db/common/database_helper.dart';

class FavouriteMovieRepository {
  FavouriteMovieRepository({required DatabaseHelper db}) {
    _db = db;
  }

  DatabaseHelper? _db;

  //* intert Fav Movies to db --------------->
  Future<dynamic> insert(Movie movie) async {
    var data = await _db!.getMovieByID(movie.id.toString());
    if (data == null) {
      var token = await _db!.insertMovie(movie);
      return token;
    } else {
      delete(movie.id.toString());
    }
    return [];
  }

  Future<Movie?> get(String id) async => await _db!.getMovieByID(id);

  Future<dynamic> delete(String id) async => await _db!.deleteMovie(id);
}
