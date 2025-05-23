import 'package:apple_music_app/config/huuua_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NothingView extends GetView {
  const NothingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GetTheme(HuuuaColorEnum.backgroundColor),
      body: Center(
        child: SizedBox(
          height: 160,
          child: Column(
            children: [
              Text(
                "nothing_tip".tr,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: GetTheme(HuuuaColorEnum.color_989FB0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
