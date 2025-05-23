import 'package:apple_music_app/config/huuua_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppbarButton extends GetView {
  final VoidCallback onItemTap;
  final IconData icon;
  final double width;
  const AppbarButton({
    Key? key,
    required this.icon,
    required this.onItemTap,
    this.width = kToolbarHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 40.w,
      child: InkWell(
        onTap: onItemTap,
        child: Container(
          // color: Colors.red,
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: GetTheme(HuuuaColorEnum.color_000000),
            size: 25.w,
          ),
        ),
      ),
    );
  }
}
