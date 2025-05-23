import 'package:apple_music_app/config/huuua_theme.dart';
import 'package:apple_music_app/util/dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

/// 页面边距
const horizontalMargin15 = 15.0; // 与返回按钮的间距一只
const verticalMargin15 = 15.0;
const horizontalMargin20 = 20.0; //外边距
const horizontalMargin25 = 25.0; //外边距

const horizontalPadding10 = 10; //内边距
const horizontalPadding12 = 12; //内边距
const horizontalPadding8 = 7.5; //内边距

const horizontalPadding4 = 4.0; //内边距

const horizontalPadding7_5 = 7.5; //内边距
const horizontalPadding15 = 15.0; //内边距

const huuuaBorderRadius6 = 6;

const buttonRadius = 25.0;
const buttonHeight = 50.0;

const audioPlayToolBarHeight = 70.0;

//弹出loading
void showLoadingDialog() {
  Get.dialog(
    Center(
      child: Container(
        color: Colors.black,
        width: 120,
        height: 120,
        child: LoadingAnimationWidget.threeArchedCircle(
          color: Colors.white,
          size: 40,
        ),
      ),
    ),
    barrierDismissible: true,
  );
}

//退出Loading
void hideLoadingDialog() {
  if (Get.isDialogOpen!) {
    Get.back();
  }
}

void showTipDialog({required String title, required String content}) {
  Get.defaultDialog(
    titlePadding: EdgeInsets.only(top: horizontalMargin20.h),
    contentPadding: EdgeInsets.only(
      top: horizontalPadding8,
      left: horizontalPadding15.w,
      right: horizontalPadding15.w,
    ),
    radius: 20.r,
    title: title,
    titleStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
    content: Text(
      content,
      style: TextStyle(
        fontSize: 17.sp,
        height: 24.sp / 17.sp,
        color: GetTheme(HuuuaColorEnum.color_000000),
      ),
    ),
    confirm: DialogButton(
      onTap: () {
        Get.back();
      },
      title: 'OK'.tr,
      textColor: GetTheme(HuuuaColorEnum.color_000000),
      borderWidth: 1.w,
    ),
  );
}

void showGetXDialog({
  required String title,
  required String content,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
  Widget? confirm,
  Widget? cancel,
}) {
  Get.defaultDialog(
    titlePadding: EdgeInsets.only(top: horizontalMargin20.h),
    contentPadding: EdgeInsets.only(
      top: horizontalPadding8.h,
      bottom: horizontalPadding8.h,
      left: horizontalPadding15.w,
      right: horizontalPadding15.w,
    ),
    radius: 20.r,
    title: title,
    titleStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
    content: Text(
      content,
      style: TextStyle(
        fontSize: 17.sp,
        height: 24.sp / 17.sp,
        color: GetTheme(HuuuaColorEnum.color_000000),
      ),
    ),
    onCancel: onCancel,
    onConfirm: onConfirm,
    cancel: cancel,
    confirm: confirm,

    // confirm: DialogButton(
    //   title: 'DELETE',
    //   textColor: GetTheme(HuuuaColorEnum.textColor_FFFFFF),
    //   color: GetTheme(HuuuaColorEnum.buttonColor_FF324B),
    // ),
  );
}

void showBottomSnakbar({required String content}) {
  Get.snackbar(
    "Tip".tr,
    content,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 1),
    margin: EdgeInsets.only(
      left: horizontalPadding15.w,
      right: horizontalPadding15.w,
      bottom: Get.mediaQuery.padding.bottom + kBottomNavigationBarHeight,
    ),
    colorText: Colors.white,
    icon: const Icon(Icons.check_circle_outline_rounded, color: Colors.white),
    backgroundColor: Colors.black87,
  );
}
