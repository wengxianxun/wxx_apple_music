import 'package:apple_music_app/config/huuua_theme.dart';
import 'package:apple_music_app/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchHistoryTagWidget extends StatelessWidget {
  final String title;

  final GestureTapCallback? onTap;
  final GestureTapCallback? deleteTap;
  const SearchHistoryTagWidget({
    Key? key,
    required this.title,
    this.onTap,
    this.deleteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = 16.r;
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: Ink(
        height: 32.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          color: GetTheme(HuuuaColorEnum.color_EEEEEE),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          child: Container(
            padding: EdgeInsets.only(left: 16.w),
            child: RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // backgroundColor: Colors.teal,
                        color: GetTheme(HuuuaColorEnum.color_AAAAAA),
                        fontSize: 14.sp,
                        height: 1,
                      ),
                    ),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: InkWell(
                      onTap: deleteTap,
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(radius),
                            bottomRight: Radius.circular(radius),
                          ),
                        ),
                        height: 32.h,
                        width: 28.w,
                        margin: EdgeInsets.only(left: 5.w),
                        padding: EdgeInsets.only(left: 4.w, right: 4.w),
                        child: Image.asset(
                          Util.assetImage('delete_fork.png'),
                          width: 16.w,
                          height: 16.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
