import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../api/master_api_service.dart';
import '../db/common/database_helper.dart';
import '../repository/favourite_movies_repository.dart';
import '../repository/genre_repository.dart';
import '../repository/movie_repository.dart';
import '../repository/trending_repository.dart';

List<SingleChildWidget> providers = <SingleChildWidget>[
  ...independentProviders,
  ..._dependentProviders,
];

List<SingleChildWidget> independentProviders = <SingleChildWidget>[
  Provider<DatabaseHelper>.value(value: DatabaseHelper.instance),
  Provider<MasterApiService>.value(value: MasterApiService()),
];

List<SingleChildWidget> _dependentProviders = <SingleChildWidget>[
  ProxyProvider<MasterApiService, TrendingRepository>(
    update: (_, MasterApiService apiService, TrendingRepository? repository) =>
        TrendingRepository(
      apiService: apiService,
    ),
  ),
  ProxyProvider<MasterApiService, MovieRepository>(
    update: (_, MasterApiService apiService, MovieRepository? repository) =>
        MovieRepository(
      apiService: apiService,
    ),
  ),
  ProxyProvider<MasterApiService, GenreRepository>(
    update: (_, MasterApiService apiService, GenreRepository? repository) =>
        GenreRepository(
      apiService: apiService,
    ),
  ),
  ProxyProvider<DatabaseHelper, FavouriteMovieRepository>(
    update: (_, DatabaseHelper db, FavouriteMovieRepository? repository) =>
        FavouriteMovieRepository(
      db: db,
    ),
  ),
];
