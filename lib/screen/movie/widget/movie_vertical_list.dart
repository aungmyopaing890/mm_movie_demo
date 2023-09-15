import 'package:flutter/material.dart';
import 'package:movie_demo/core/constant/dimesions.dart';
import 'package:movie_demo/screen/common/customshimmer.dart';

import '../../../core/viewobject/movie_data.dart';
import '../widget/movie_vertical_list_item.dart';

class MovieVerticalListView extends StatelessWidget {
  const MovieVerticalListView(
      {super.key,
      this.moviesList,
      required this.dataLength,
      required this.isLoading,
      required this.scrollController});

  final List<Movie>? moviesList;
  final int dataLength;
  final bool isLoading;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        controller: scrollController,
        padding: EdgeInsets.all(Dimesion.width5),
        itemCount: isLoading ? 9 : dataLength,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: Dimesion.screeHigh * 0.24,
            mainAxisSpacing: Dimesion.width5,
            crossAxisSpacing: Dimesion.width5),
        itemBuilder: (_, index) => isLoading
            ? const CustomShimmer()
            : MovieVerticalListItem(
                movie: moviesList![index],
              ));
  }
}
