import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_demo/core/provider/movie/search_movie_provider.dart';
import 'package:movie_demo/screen/common/empty_box_widget.dart';
import 'package:provider/provider.dart';
import '../../../core/repository/movie_repository.dart';
import '../../common/search_textfield.dart';
import '../widget/movie_vertical_list.dart';

class SearchMoviesTab extends StatefulWidget {
  const SearchMoviesTab({super.key});

  @override
  State<SearchMoviesTab> createState() => _SearchMoviesTabState();
}

class _SearchMoviesTabState extends State<SearchMoviesTab> {
  late SearchMovieProvider provider;
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final MovieRepository nowPlayingRepositoty =
        Provider.of<MovieRepository>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchMovieProvider>(
            lazy: false,
            create: (BuildContext context) {
              provider = SearchMovieProvider(repository: nowPlayingRepositoty);
              return provider;
            }),
      ],
      child: Consumer<SearchMovieProvider>(builder:
          (BuildContext context, SearchMovieProvider pro, Widget? child) {
        return Column(
          children: [
            SearchTextFieldWidget(
                searchController: searchController,
                hintText: 'Search Movies',
                search: () {
                  provider.searchMovies(searchController.text);
                }),
            pro.hasData
                ? Expanded(
                    child: MovieVerticalListView(
                      dataLength: pro.datalength,
                      isLoading: pro.isLoading,
                      moviesList: pro.nowPlaylist,
                      scrollController: scrollController,
                    ),
                  )
                : const EmptyBoxWidget(message: 'There is no Movies')
          ],
        );
      }),
    );
  }
}
