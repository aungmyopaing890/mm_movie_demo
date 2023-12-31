import 'package:flutter/material.dart';
import 'package:movie_demo/core/constant/dimesions.dart';

import 'package:movie_demo/core/viewobject/movie_data.dart';
import 'package:movie_demo/screen/common/customshimmer.dart';
import 'package:movie_demo/screen/movie/widget/detail_page/bottom_widget.dart';
import 'package:movie_demo/screen/movie/widget/poster.dart';
import 'package:provider/provider.dart';

import '../../../config/master_config.dart';
import '../../../core/provider/genre/genre_provider.dart';
import '../../../core/provider/movie/favourite_movie_provider.dart';
import '../../../core/provider/movie/movie_details_provider.dart';
import '../../../core/repository/favourite_movies_repository.dart';
import '../../../core/repository/genre_repository.dart';
import '../../../core/repository/movie_repository.dart';
import '../widget/detail_page/genres_widget.dart';

class DetailPage extends StatefulWidget {
  final Movie movie;
  const DetailPage({super.key, required this.movie});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late FavouriteMovieProvider favouriteMovieProvider;

  late MovieGenreProvider movieGenreProvider;

  @override
  Widget build(BuildContext context) {
    final MovieRepository movieRepository =
        Provider.of<MovieRepository>(context);
    final GenreRepository genreRepository =
        Provider.of<GenreRepository>(context);
    final FavouriteMovieRepository favouriteMovieRepository =
        Provider.of<FavouriteMovieRepository>(context);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<MovieGenreProvider>(
            lazy: false,
            create: (BuildContext context) {
              movieGenreProvider =
                  MovieGenreProvider(repository: genreRepository);
              movieGenreProvider.loadDataList(movie: widget.movie);
              return movieGenreProvider;
            },
          ),
          ChangeNotifierProvider<MovieDetailsProvider>(
            lazy: false,
            create: (BuildContext context) {
              MovieDetailsProvider provider =
                  MovieDetailsProvider(repository: movieRepository);
              provider.loadData(id: widget.movie.id.toString());
              return provider;
            },
          ),
          ChangeNotifierProvider<FavouriteMovieProvider>(
            lazy: false,
            create: (BuildContext context) {
              favouriteMovieProvider =
                  FavouriteMovieProvider(repository: favouriteMovieRepository);
              favouriteMovieProvider.getByID(widget.movie.id.toString());
              return favouriteMovieProvider;
            },
          ),
        ],
        child: Consumer<MovieDetailsProvider>(builder:
            (BuildContext context, MovieDetailsProvider pro, Widget? child) {
          // if (isFirst) {
          //   movieGenreProvider.loadDataList(movie: pro.movie);
          // }
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.black,
                leading: const BackButton(
                  color: Colors.white,
                ),
                flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                  children: [
                    pro.isLoading
                        ? const CustomShimmer()
                        : MoviePoster(
                            url:
                                "${MasterConfig.back_drop_url}${pro.movie.backdropPath}",
                            boxfit: BoxFit.cover,
                            borderRadius: BorderRadius.zero),
                    Positioned.fill(
                        child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Colors.black,
                            Colors.black,
                            Colors.black,
                            Colors.black.withOpacity(0.9),
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.5),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.0),
                            Colors.black.withOpacity(0.0),
                            Colors.black.withOpacity(0.0),
                            Colors.black.withOpacity(0.0),
                            Colors.black.withOpacity(0.0),
                            Colors.black.withOpacity(0.0),
                            Colors.black.withOpacity(0.0),
                            Colors.black.withOpacity(0.0),
                          ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter)),
                    )),
                  ],
                )),
                expandedHeight: Dimesion.screeHigh * 0.2,
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(Dimesion.screeHigh * 0.4),
                    child: BottomWidget(
                      isloading: pro.isLoading,
                      movie: pro.movie,
                    )),
              ),
              const SliverToBoxAdapter(
                child: GenresWidget(),
              ),
              SliverToBoxAdapter(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Overview",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                      pro.isLoading
                          ? Container(
                              height: Dimesion.screeHigh * 0.2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimesion.radius15 / 2)),
                              child: const CustomShimmer(),
                            )
                          : Text(
                              pro.movie.overview ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(color: Colors.white),
                            ),
                    ]),
              )
            ],
          );
        }));
  }
}
