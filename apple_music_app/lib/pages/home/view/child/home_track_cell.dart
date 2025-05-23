import 'package:apple_music_app/config/huuua_theme.dart';
import 'package:apple_music_app/model/track_model.dart';
import 'package:apple_music_app/util/avatar_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeTrackCell extends GetView {
  final TrackModel model;
  final bool showMore;
  final VoidCallback onClick;

  final Color? backgroundColor;
  final bool showBorderSide;
  HomeTrackCell({
    required this.model,
    this.showMore = true,
    this.showBorderSide = true,
    this.backgroundColor,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        this.onClick();
      },
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Container(
      // color: Colors.black12,
      color: this.backgroundColor ?? GetTheme(HuuuaColorEnum.backgroundColor),
      // margin: EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 头像
          AvatarImageWidget(
            imgUrl: model.artworkUrl100 ?? "",
            width: 65.w,
            height: 65.w,
            radius: 4.r,
          ),
          const SizedBox(width: 12),
          // 右边内容
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border:
                    showBorderSide
                        ? Border(
                          bottom: BorderSide(
                            color: Colors.black12, // 下划线颜色
                            width: 1.0, // 下划线宽度
                          ),
                        )
                        : Border.all(width: 0, color: Colors.transparent),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 昵称 + 时间 + 点赞
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            model.trackName ?? "",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  // 评论内容
                  Text(
                    model.collectionName ?? "",
                    style: TextStyle(fontSize: 12.sp, color: Colors.black45),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          model.artistName,

                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          model.releaseDate.toString(),
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
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
