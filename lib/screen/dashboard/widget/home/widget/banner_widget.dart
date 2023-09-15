import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:movie_demo/core/provider/trending/trending_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../config/master_config.dart';
import '../../../../../core/constant/dimesions.dart';
import '../../../../../core/utils/utils.dart';

class BannerImages extends StatefulWidget {
  const BannerImages({Key? key}) : super(key: key);

  @override
  State<BannerImages> createState() => _BannerImagesState();
}

class _BannerImagesState extends State<BannerImages> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<TrendingProvider>(
        builder: (BuildContext context, TrendingProvider pro, Widget? child) {
      if (pro.hasData) {
        return Column(
          children: [
            CarouselSlider.builder(
              itemBuilder: ((context, index, i) {
                return CachedNetworkImage(
                    imageUrl:
                        '${MasterConfig.img_Url}${pro.trendingList[index].backdropPath ?? ""}',
                    height: Dimesion.height40 * 4,
                    placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                    errorWidget: (context, url, error) =>
                        Image.asset('assets/images/noimg.png'),
                    imageBuilder: (context, img) {
                      return Stack(children: [
                        Container(
                          width: Dimesion.screenWidth,
                          height: Dimesion.screeHigh * 0.25,
                          margin:
                              EdgeInsets.symmetric(horizontal: Dimesion.width5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimesion.radius15 / 2),
                              image: DecorationImage(
                                  image: img, fit: BoxFit.cover)),
                          foregroundDecoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
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
                                  Colors.black.withOpacity(0.0)
                                ]),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: SizedBox(
                            width: Dimesion.screenWidth,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: Dimesion.width5),
                                    child: Text(
                                      pro.trendingList[index].mediaType ==
                                              "movie"
                                          ? pro.trendingList[index]
                                                  .originalTitle ??
                                              ""
                                          : pro.trendingList[index]
                                                  .originalName ??
                                              "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: Dimesion.width5,
                                        right: Dimesion.width5),
                                    child: Text(
                                        pro.trendingList[index].overview ?? "",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                              color: Colors.white,
                                            )),
                                  )
                                ]),
                          ),
                        )
                      ]);
                    });
              }),
              itemCount: pro.datalength,
              options: CarouselOptions(
                  height: Dimesion.screeHigh * 0.25,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) => setState(() {
                        activeIndex = index;
                      }),
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  enlargeCenterPage: true,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  autoPlayInterval: const Duration(
                    seconds: 4,
                  )),
            ),
            SizedBox(
              height: Dimesion.height10,
            ),
            AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: pro.trendingList.length,
              effect: WormEffect(
                  dotHeight: Dimesion.width5,
                  dotWidth: Dimesion.width5,
                  activeDotColor: Colors.white),
            )
          ],
        );
      } else {
        {
          return Container(
              padding: EdgeInsets.symmetric(horizontal: Dimesion.height10),
              height: Dimesion.height40 * 4,
              width: Dimesion.height80 * 4,
              child: Shimmer.fromColors(
                  baseColor: Colors.black12,
                  highlightColor: Utils.isLightMode(context)
                      ? Colors.white12
                      : Colors.black54,
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          BorderRadius.all(Radius.circular(Dimesion.height8)),
                    ),
                    child: const Text(
                      'Test',
                      style: TextStyle(color: Colors.white),
                    ),
                  )));
        }
      }
      // else {
      //   return Container(
      //       alignment: Alignment.center,
      //       padding: EdgeInsets.symmetric(horizontal: Dimesion.height10),
      //       height: Dimesion.height40 * 4,
      //       width: Dimesion.height80 * 4,
      //       child: const Text('No Data'));
      // }
    });
  }
}
