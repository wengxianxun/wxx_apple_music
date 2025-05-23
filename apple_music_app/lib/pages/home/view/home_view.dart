import 'package:apple_music_app/config/huuua_theme.dart';
import 'package:apple_music_app/model/track_model.dart';
import 'package:apple_music_app/pages/home/home_controller.dart';
import 'package:apple_music_app/pages/home/view/child/home_track_cell.dart';
import 'package:apple_music_app/routes/app_pages.dart';
import 'package:apple_music_app/util/appbar_title.dart';
import 'package:apple_music_app/util/noting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: "HomeView",
      init: controller,
      builder: (value) {
        return bodyView();
      },
    );
  }

  Widget bodyView() {
    return Scaffold(
      appBar: AppBar(
        // leading: AppbarButton(
        backgroundColor: GetTheme(HuuuaColorEnum.backgroundColor),

        //   onItemTap: () {
        //     Get.back();
        //   },
        //   icon: Icons.arrow_back,
        // ),
        foregroundColor: Colors.transparent,
        centerTitle: false,
        elevation: 0.0,
        // shadowColor: Colors.transparent,
        title: SizedBox(
          // height: 70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppbarTitle(
                title: 'music',
                color: GetTheme(HuuuaColorEnum.defaultTextColor),
                fontSize: 30.sp,
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: GetTheme(HuuuaColorEnum.defaultTextColor),
            onPressed: () {
              // 搜索按钮点击事件，可在此处添加导航到搜索页或触发搜索逻辑
              Get.toNamed(Routes.MusicSearchView);
            },
          ),
        ],
      ),
      // drawer: _drawer,
      body: Container(
        color: GetTheme(HuuuaColorEnum.backgroundColor),
        child: Obx(() {
          if (controller.musicResult.value.trackList?.isEmpty ?? true) {
            return NothingView();
          }
          return bodyListView();
        }),
      ),
    );
  }

  Widget bodyListView() {
    return SmartRefresher(
      enablePullDown: false,
      enablePullUp: true,
      controller: controller.refreshController,
      onLoading: () {
        print("onload........");
        //加载
        // controller.reqMoreData();
        controller.reqMoreMusicResult();
      },
      child: CustomScrollView(slivers: <Widget>[sliverListNovels()]),
    );
  }

  SliverList sliverListNovels() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        TrackModel model = controller.musicResult.value.trackList![index];

        return HomeTrackCell(model: model, onClick: () {});
      }, childCount: controller.musicResult.value.trackList!.length),
    );
  }
}
