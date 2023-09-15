import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_demo/core/provider/movie/now_playing_provider.dart';
import 'package:provider/provider.dart';
import '../../../core/repository/movie_repository.dart';
import '../widget/movie_vertical_list.dart';

class NowPlayingMoviesTab extends StatefulWidget {
  const NowPlayingMoviesTab({super.key});

  @override
  State<NowPlayingMoviesTab> createState() => _NowPlayingMoviesTabState();
}

class _NowPlayingMoviesTabState extends State<NowPlayingMoviesTab> {
  ScrollController scrollController = ScrollController();
  late NowPlayingMoviesProvider nowPlayingProvider;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        nowPlayingProvider.loadNextDataList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final MovieRepository movieRepository =
        Provider.of<MovieRepository>(context);

    return ChangeNotifierProvider<NowPlayingMoviesProvider>(
      lazy: false,
      create: (BuildContext context) {
        nowPlayingProvider =
            NowPlayingMoviesProvider(repository: movieRepository);
        nowPlayingProvider.loadDataList();
        return nowPlayingProvider;
      },
      child: Consumer<NowPlayingMoviesProvider>(builder:
          (BuildContext context, NowPlayingMoviesProvider pro, Widget? child) {
        return MovieVerticalListView(
          dataLength: pro.datalength,
          isLoading: pro.isLoading,
          moviesList: pro.nowPlaylist,
          scrollController: scrollController,
        );
      }),
    );
  }
}
