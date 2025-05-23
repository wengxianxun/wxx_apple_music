import 'package:apple_music_app/config/huuua_theme.dart';
import 'package:apple_music_app/pages/search/music_search_controller.dart';
import 'package:apple_music_app/pages/search/view/child/serch_normal_view/child/search_history_tag_widget.dart';
import 'package:apple_music_app/util/appbar_image_button.dart';
import 'package:apple_music_app/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchNormalView extends GetView<MusicSearchController> {
  SearchNormalView();

  @override
  Widget build(BuildContext context) {
    return Container(child: bodyListView());
  }

  Widget bodyListView() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(child: SizedBox(height: 2.h)),
        sliverSearchHistory(),
      ],
    );
  }

  SliverToBoxAdapter sliverSearchHistory() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "search_history".tr,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Expanded(child: Container()),
                  controller.keywordHistoryList.isEmpty
                      ? Container(height: 40)
                      : AppbarImageButton(
                        width: 40,
                        height: 40,
                        image: Image.asset(
                          Util.assetImage('delete_selected.png'),
                          width: 20.w,
                          height: 20.w,
                        ),
                        onItemTap: () {
                          //清空历史
                          // controller.cleanAllKeywordHistory();
                        },
                      ),
                ],
              ),
              SizedBox(height: 2.h),
              controller.keywordHistoryList.isEmpty
                  ? Container(
                    margin: EdgeInsets.only(top: 30.h, bottom: 10.h),
                    alignment: Alignment.center,
                    child: Text(
                      "No search records",
                      style: TextStyle(
                        color: GetTheme(HuuuaColorEnum.color_AAAAAA),
                        fontSize: 16.sp,
                      ),
                    ),
                  )
                  : Wrap(
                    spacing: 10.w,
                    runSpacing: 15.h,
                    children:
                        controller.keywordHistoryList.map((keyword) {
                          return SearchHistoryTagWidget(
                            title: keyword,
                            onTap: () {
                              // controller.tagTapSearch(keyword);
                            },
                            deleteTap: () {
                              // controller.deleteKeywordHistory(keyword);
                            },
                          );
                        }).toList(),
                  ),
            ],
          );
        }),
      ),
    );
  }
}
