//小说view

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvatarImageWidget extends GetView {
  final String imgUrl;
  final double width;
  final double height;
  final double? radius;
  AvatarImageWidget({
    required this.imgUrl,
    required this.width,
    required this.height,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? width / 2)),
      ),
      child: CachedNetworkImage(
        fit: BoxFit.contain,
        repeat: ImageRepeat.repeatX,
        imageUrl: imgUrl,
        imageBuilder: (context, imageProvider) {
          return imageWidget(imageProvider);
        },
        errorWidget: (context, url, error) {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? width / 2),
            ),
            child: Image.asset("assets/images/user.png"),
          );
        },
      ),
    );
  }

  Widget imageWidget(ImageProvider? imageProvider) {
    return Container(
      alignment: Alignment.bottomCenter,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? width / 2)),
        image:
            imageProvider == null
                ? null
                : DecorationImage(image: imageProvider, fit: BoxFit.cover),
        // borderRadius: const BorderRadius.all(
        //   Radius.circular(4),
        // ),
      ),
      // child: Container(
      //   width: double.infinity,
      //   height: 100,
      // ),
    );
  }
}
