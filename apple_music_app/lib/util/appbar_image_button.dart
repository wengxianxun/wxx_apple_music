import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppbarImageButton extends GetView {
  final VoidCallback onItemTap;
  final Image image;
  final double width;
  final double height;
  const AppbarImageButton({
    Key? key,
    required this.image,
    required this.onItemTap,
    this.width = kToolbarHeight,
    this.height = kToolbarHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: width,
      height: height,
      child: InkWell(
        onTap: onItemTap,
        child: Container(
          // color: Colors.teal,
          alignment: Alignment.center,
          child: image,
        ),
      ),
    );
  }
}
