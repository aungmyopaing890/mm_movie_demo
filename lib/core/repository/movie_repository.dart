import '../api/master_api_service.dart';

class MovieRepository {
  MovieRepository({required MasterApiService apiService}) {
    _apiService = apiService;
  }

  MasterApiService? _apiService;

  //* Get Trending --------------->
  Future<dynamic> getNowPlaying({required int page}) async {
    return await _apiService!.getNowPlaying(page: page);
  }

  //* Get PopularMovies --------------->
  Future<dynamic> getPopularMovies({required int page}) async {
    return await _apiService!.getPopularMovies(page: page);
  }

  //* Get searchMovies --------------->
  Future<dynamic> searchMovies(String query, int page) async {
    return await _apiService!.searchMovies(query, page);
  }

  //* Get MovieDetails --------------->
  Future<dynamic> getMovieDetails(String id) async {
    return await _apiService!.getMovieDetails(id);
  }
}
