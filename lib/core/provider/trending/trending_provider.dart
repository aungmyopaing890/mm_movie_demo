import 'package:flutter/material.dart';
import 'package:movie_demo/core/repository/trending_repository.dart';
import 'package:movie_demo/core/viewobject/trending.dart';

class TrendingProvider extends ChangeNotifier {
  TrendingProvider({
    required TrendingRepository repository,
    int limit = 0,
  }) {
    _repository = repository;
  }

  TrendingRepository? _repository;
  List<TrendingData> trendingList = <TrendingData>[];
  TrendingModel trendingModel = TrendingModel();
  bool isLoading = false;
  Future<void> loadDataList() async {
    isLoading = true;
    var dataMap = await _repository!.getTrending();

    var data = TrendingModel.fromJson(dataMap);
    trendingList.addAll(data.results!);
    isLoading = false;
    notifyListeners();
  }

  bool get hasData {
    return trendingList.isEmpty ? false : true;
  }

  int get datalength {
    return trendingList.length;
  }
}
