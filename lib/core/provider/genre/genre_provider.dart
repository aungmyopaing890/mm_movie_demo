import 'package:flutter/material.dart';
import 'package:movie_demo/core/viewobject/genre.dart';
import '../../repository/genre_repository.dart';
import '../../viewobject/movie_data.dart';

class MovieGenreProvider extends ChangeNotifier {
  MovieGenreProvider({
    required GenreRepository repository,
    int limit = 0,
  }) {
    _repository = repository;
  }

  GenreRepository? _repository;
  List<String> genreStr = [];

  GenreDataModel genreDataModel = GenreDataModel();
  bool isLoading = false;

  Future<void> loadDataList({required Movie movie}) async {
    isLoading = true;
    var dataMap = await _repository!.getGenres();
    genreDataModel = GenreDataModel.fromJson(dataMap);
    List<String> catlist = [];
    movie.genreIds?.forEach((id) {
      for (Genre m in genreDataModel.genres ?? []) {
        m.id == id ? catlist.add(m.name ?? '') : null;
      }
    });
    String cat = catlist.isEmpty ? 'N/A' : catlist.take(5).join(', ');
    genreStr = cat.split(',');
    isLoading = false;
    notifyListeners();
  }

  bool get hasData {
    return genreStr.isEmpty ? false : true;
  }

  int get datalength {
    return genreStr.length;
  }
}
