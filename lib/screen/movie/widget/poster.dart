import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/dimesions.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster(
      {super.key,
      required this.url,
      this.width,
      this.height,
      required this.boxfit,
      required this.borderRadius});
  final String url;
  final double? width;
  final double? height;
  final BoxFit boxfit;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      progressIndicatorBuilder: (context, url, progress) => Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          child: SizedBox(
              height: height,
              child: Center(
                  child: CupertinoActivityIndicator(
                color: Colors.white,
                radius: Dimesion.radius15 / 2,
              )))),
      errorWidget: (context, url, error) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
          ),
          child: SizedBox(
            height: height,
            child: Image.asset("assets/images/noimg.png"),
          )),
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: borderRadius,
            image: DecorationImage(image: imageProvider, fit: boxfit)),
      ),
    );
  }
}
