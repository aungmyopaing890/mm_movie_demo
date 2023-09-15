import 'package:flutter/material.dart';
import 'package:movie_demo/core/viewobject/movie_data.dart';
import 'package:movie_demo/screen/common/customshimmer.dart';
import 'package:provider/provider.dart';

import '../../../../config/master_config.dart';
import '../../../../core/constant/dimesions.dart';
import '../../../../core/provider/movie/favourite_movie_provider.dart';
import '../poster.dart';

class BottomWidget extends StatelessWidget {
  final Movie movie;
  final bool isloading;
  const BottomWidget({super.key, required this.movie, required this.isloading});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: Dimesion.height100),
        padding: EdgeInsets.all(Dimesion.width5),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimesion.radius15 / 2),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: const Offset(0, 5))
                  ]),
              child: isloading
                  ? Container(
                      height: Dimesion.screeHigh * 0.2,
                      width: Dimesion.screenWidth * 0.3,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimesion.radius15 / 2)),
                      child: const CustomShimmer(),
                    )
                  : MoviePoster(
                      url: "${MasterConfig.img_Url}${movie.posterPath}",
                      height: Dimesion.screeHigh * 0.2,
                      width: Dimesion.screenWidth * 0.3,
                      boxfit: BoxFit.cover,
                      borderRadius:
                          BorderRadius.circular(Dimesion.radius15 / 2),
                    ),
            ),
            SizedBox(
              width: Dimesion.width10,
            ),
            isloading
                ? Container(
                    height: Dimesion.screeHigh * 0.2,
                    width: Dimesion.screenWidth * 0.5,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimesion.radius15 / 2)),
                    child: const CustomShimmer(),
                  )
                : Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                        Text(
                          MasterConfig.dateFormat
                              .format(movie.releaseDate ?? DateTime.now()),
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          height: Dimesion.width5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: Dimesion.width5 * 2,
                            ),
                            Text(
                              movie.voteAverage.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              "(${movie.voteCount.toString()} Votes)",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        Consumer<FavouriteMovieProvider>(builder:
                            (BuildContext context, FavouriteMovieProvider pro,
                                Widget? child) {
                          return InkWell(
                              onTap: () async {
                                await pro.insert(movie);
                              },
                              child: Container(
                                  margin:
                                      EdgeInsets.only(top: Dimesion.height10),
                                  child: pro.isfav
                                      ? const Icon(
                                          Icons.favorite,
                                          color: Colors.white,
                                          size: 25,
                                        )
                                      : const Icon(
                                          Icons.favorite_outline,
                                          color: Colors.white,
                                          size: 25,
                                        )));
                        }),
                      ],
                    ),
                  ),
          ],
        ));
  }
}
