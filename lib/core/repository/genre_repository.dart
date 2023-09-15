import '../api/master_api_service.dart';

class GenreRepository {
  GenreRepository({required MasterApiService apiService}) {
    _apiService = apiService;
  }

  MasterApiService? _apiService;

  //* Get Movies Genres --------------->
  Future<dynamic> getGenres() async {
    return await _apiService!.getGenres();
  }
}
