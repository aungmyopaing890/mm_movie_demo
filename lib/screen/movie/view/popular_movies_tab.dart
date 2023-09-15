import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/provider/movie/popular_movie_provider.dart';
import '../../../core/repository/movie_repository.dart';
import '../widget/movie_vertical_list.dart';

class PopularMoviesTab extends StatefulWidget {
  const PopularMoviesTab({super.key});

  @override
  State<PopularMoviesTab> createState() => _PopularMoviesTabState();
}

class _PopularMoviesTabState extends State<PopularMoviesTab> {
  ScrollController scrollController = ScrollController();
  late PopularMoviesProvider provider;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        provider.loadNextDataList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final MovieRepository movieRepository =
        Provider.of<MovieRepository>(context);
    return ChangeNotifierProvider<PopularMoviesProvider>(
      lazy: false,
      create: (BuildContext context) {
        provider = PopularMoviesProvider(repository: movieRepository);
        provider.loadDataList();
        return provider;
      },
      child: Consumer<PopularMoviesProvider>(builder:
          (BuildContext context, PopularMoviesProvider pro, Widget? child) {
        return MovieVerticalListView(
            dataLength: pro.datalength,
            isLoading: pro.isLoading,
            moviesList: pro.moviesList,
            scrollController: scrollController);
      }),
    );
  }
}
