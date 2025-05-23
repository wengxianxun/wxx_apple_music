import 'package:apple_music_app/config/huuua_ui_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogButton extends StatelessWidget {
  final String title;
  final Color? color;
  final double? borderWidth;
  final GestureTapCallback onTap;
  final Color textColor;
  const DialogButton({
    Key? key,
    required this.title,
    required this.textColor,
    required this.onTap,
    this.color = Colors.transparent,
    this.borderWidth = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: horizontalMargin20.h),
      child: Ink(
        width: 110.w,
        height: 44.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(44.r)),
          border: Border.all(
            color: borderWidth == 0 ? Colors.transparent : Colors.black,
            width: borderWidth!,
          ),
          color: color,
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.all(Radius.circular(44.r)),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(color: textColor, fontSize: 15.sp),
            ),
          ),
        ),
      ),
    );
  }
}
