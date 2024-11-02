import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:monkey_ao/constants/app_constants.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget(
      {super.key,
      required this.imgUrl,
      this.imgHeight,
      this.imgWidth,
      this.boxFit});
  final String? imgUrl;
  final double? imgHeight;
  final double? imgWidth;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return CachedNetworkImage(
      height: imgHeight ?? size.width * 0.5,
      width: imgWidth ?? size.width,
      imageUrl: imgUrl ?? AppConstants.animalImage,
      fit: boxFit ?? BoxFit.cover,
      errorWidget: (context, url, error) => Image.asset(
        'images/noImage.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
