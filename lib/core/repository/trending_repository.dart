import '../api/master_api_service.dart';

class TrendingRepository {
  TrendingRepository({required MasterApiService apiService}) {
    _apiService = apiService;
  }

  MasterApiService? _apiService;

  //* Get Trending --------------->
  Future<dynamic> getTrending() async {
    return await _apiService!.getTrendingData();
  }
}
