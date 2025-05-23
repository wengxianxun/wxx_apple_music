import 'package:apple_music_app/config/huuua_config.dart';
import 'package:apple_music_app/config/huuua_theme.dart';
import 'package:apple_music_app/pages/app/app_controller.dart';
import 'package:apple_music_app/util/huuua_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppLunchView extends StatefulWidget {
  final VoidCallback onOpenCallBack;
  final AppController appController;

  AppLunchView({
    Key? key,
    required this.onOpenCallBack,
    required this.appController,
  }) : super(key: key);

  @override
  _LunchState createState() => _LunchState();
}

class _LunchState extends State<AppLunchView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // lunchbackground.png
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          // Positioned(
          //     child: Image.asset(
          //   "assets/images/lunchbackground.png",
          //   width: 375.w,
          //   height: 812.h,
          // )),
          Positioned(
            child: Container(
              width: 375.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(22.r)),
                    child: Image.asset(
                      "assets/images/wxxlogo.png",
                      width: 109.w,
                      height: 109.w,
                    ),
                  ),
                  Spacer(),
                  widget.appController.netType.value == NetType.noNet
                      ? Text(
                        "netlinkfailed".tr,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: GetTheme(HuuuaColorEnum.color_000000),
                        ),
                      )
                      : Container(
                        child: LoadingAnimationWidget.threeArchedCircle(
                          color: GetTheme(HuuuaColorEnum.color_000000),
                          size: 40,
                        ),
                      ),
                  SizedBox(
                    height:
                        widget.appController.netType.value == NetType.noNet
                            ? 16
                            : 0,
                  ),
                  widget.appController.netType.value == NetType.noNet
                      ? HuuuaButton(
                        title: "retry".tr,
                        fontSize: 16.sp,
                        borderWidth: 1,
                        width: 80.w,
                        height: 36.h,
                        // borderColor: GetTheme(HuuuaColorEnum.color_FFFFFF),
                        color: GetTheme(HuuuaColorEnum.color_FFD600),
                        textColor: GetTheme(HuuuaColorEnum.color_000000),
                        onTap: () async {
                          widget.appController.checkNet();
                        },
                      )
                      : Container(),
                  // InkWell(
                  //   onTap: () {},
                  //   child: Container(
                  //     width: 80.w,
                  //     height: 32.h,
                  //     alignment: Alignment.center,
                  //     decoration: BoxDecoration(
                  //       borderRadius: const BorderRadius.all(Radius.circular(16)),
                  //       border: Border.all(width: 1, color: Colors.black87),
                  //     ),
                  //     child: Text(
                  //       "retry".tr,
                  //       softWrap: true,
                  //       style:
                  //           GoogleFonts.alef(fontSize: 12, color: Colors.black87),
                  //     ),
                  //   ),
                  // ),
                  Spacer(),
                  Text(
                    "HOLY BIBLE",
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: GetTheme(HuuuaColorEnum.master_color),
                    ),
                  ),
                  SizedBox(
                    height: 60.0.h + Get.context!.mediaQueryPadding.bottom!,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
