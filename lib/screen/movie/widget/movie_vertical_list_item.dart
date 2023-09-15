import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:movie_demo/screen/movie/widget/poster.dart';

import '../../../../../core/constant/dimesions.dart';
import '../../../config/master_config.dart';
import '../../../core/viewobject/movie_data.dart';
import '../view/movie_detail_page.dart';

class MovieVerticalListItem extends StatelessWidget {
  const MovieVerticalListItem({
    super.key,
    required this.movie,
  });
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        closedColor: Colors.transparent,
        closedElevation: 0,
        openColor: Colors.black,
        openElevation: 0,
        transitionDuration: const Duration(milliseconds: 500),
        transitionType: ContainerTransitionType.fadeThrough,
        closedBuilder: (_, close) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MoviePoster(
                  height: Dimesion.screeHigh * 0.19,
                  url: "${MasterConfig.img_Url}${movie.posterPath}",
                  boxfit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(Dimesion.radius15 / 2),
                ),
                Text(
                  movie.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: Dimesion.width5 / 2,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                  ],
                )
              ],
            ),
        openBuilder: (_, open) => DetailPage(
              movie: movie,
            ));
  }
}
