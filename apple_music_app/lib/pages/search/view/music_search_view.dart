import 'package:apple_music_app/config/huuua_theme.dart';
import 'package:apple_music_app/pages/search/music_search_controller.dart';
import 'package:apple_music_app/pages/search/view/child/saerch_appbar.dart';
import 'package:apple_music_app/pages/search/view/child/search_result_view/search_result_view.dart';
import 'package:apple_music_app/util/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MusicSearchView extends GetView<MusicSearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        inBar: false,
        searchController: controller,
        onSubmitted: (String value) {
          // 开始搜索
          controller.searchText.value = value;
          controller.isSearching = true;
          // controller.actionSearchReq();
          controller.searchKeyword();
        },
        onCleared: () {
          devLog("cleared");
          // 清空
          controller.searchText.value = '';
          controller.searchTextValue = '';
          controller.isSearching = false;
          controller.updateSearchView();
          // controller.cleanResult();
        },
        onClosed: () {
          devLog("closed");
          controller.searchText.value = '';
          controller.searchTextValue = '';
          controller.isSearching = false;
          controller.updateSearchView();
        },
        onChanged: (String value) {
          controller.searchText.value = value;
        },
        buildDefaultAppBar: (BuildContext context) {
          return AppBar();
        },
        setState: (void Function() fn) {},
        controller: controller.textEditingController,
      ).build(context),
      body: Container(
        color: GetTheme(HuuuaColorEnum.backgroundColor),
        child: Column(
          children: [
            Flexible(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return SearchResultView();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
