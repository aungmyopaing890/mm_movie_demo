import 'package:flutter/material.dart';
import 'package:movie_demo/core/constant/dimesions.dart';
import 'package:movie_demo/core/provider/genre/genre_provider.dart';
import 'package:movie_demo/screen/common/customshimmer.dart';
import 'package:provider/provider.dart';

class GenresWidget extends StatelessWidget {
  const GenresWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieGenreProvider>(
        builder: (BuildContext context, MovieGenreProvider pro, Widget? child) {
      return Wrap(
        spacing: Dimesion.width5,
        runSpacing: 0,
        alignment: WrapAlignment.start,
        children: List.generate(
            pro.isLoading ? 3 : pro.datalength,
            (index) => pro.isLoading
                ? Container(
                    width: Dimesion.height100,
                    height: Dimesion.height30,
                    padding: EdgeInsets.all(Dimesion.width5 / 2),
                    child: const CustomShimmer())
                : Chip(
                    padding: EdgeInsets.all(Dimesion.width5 / 2),
                    backgroundColor: Colors.white.withOpacity(0.0),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    surfaceTintColor: Colors.white.withOpacity(0.0),
                    label: Text(pro.genreStr[index]))),
      );
    });
  }
}
