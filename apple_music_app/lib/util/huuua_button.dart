import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HuuuaButton extends StatelessWidget {
  final String title;
  final Color? color;
  final double? borderWidth;
  final Color? borderColor;
  final GestureTapCallback onTap;
  final Color textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final Color? backGroundColor;

  const HuuuaButton({
    Key? key,
    required this.title,
    required this.textColor,
    required this.onTap,
    this.color = Colors.transparent,
    this.borderWidth = 0.0,
    this.width,
    this.height,
    this.fontSize,
    this.borderColor,
    this.backGroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(
        Radius.circular(height != null ? height!.r : 44.r),
      ),
      color: backGroundColor,
      child: Ink(
        width: width ?? 121.w,
        height: height ?? 44.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(height != null ? height!.r : 44.r),
          ),
          border: Border.all(
            color:
                borderWidth == 0
                    ? Colors.transparent
                    : borderColor ?? Colors.black,
            width: borderWidth!,
          ),
          color: color,
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.all(
            Radius.circular(height != null ? height!.r : 44.r),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(color: textColor, fontSize: fontSize ?? 15.sp),
            ),
          ),
        ),
      ),
    );
  }
}
