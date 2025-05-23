import 'package:apple_music_app/config/huuua_theme.dart';
import 'package:apple_music_app/util/appbar_image_button.dart';
import 'package:apple_music_app/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingView extends StatelessWidget {
  bool? isBackBtn;

  LoadingView({super.key, this.isBackBtn = false});

  @override
  Widget build(BuildContext context) {
    return checkView();
  }

  Widget checkView() {
    return isBackBtn! ? backView() : normalView();
  }

  Widget backView() {
    return Scaffold(
      appBar: AppBar(
        leading: AppbarImageButton(
          width: 46.w,
          height: 46.w,
          image: Image.asset(
            Util.assetImage('arrow_left.png'), //阅读历史
            width: 26.w,
            height: 26.w,
          ),
          onItemTap: () {
            Get.back();
          },
        ),
        backgroundColor: GetTheme(HuuuaColorEnum.appBarbackgroundColor),
        elevation: 0.0,
        titleSpacing: 0.0,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        alignment: Alignment.center,
        child: LoadingAnimationWidget.threeArchedCircle(
          color: Colors.black,
          size: 40,
        ),
      ),
    );
  }

  Widget normalView() {
    return Scaffold(
      body: Container(
        color: GetTheme(HuuuaColorEnum.backgroundColor),
        alignment: Alignment.center,
        child: LoadingAnimationWidget.threeArchedCircle(
          color: Colors.black,
          size: 40,
        ),
      ),
    );
  }
}
