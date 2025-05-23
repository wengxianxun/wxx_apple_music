import 'package:apple_music_app/model/track_model.dart';
import 'package:apple_music_app/pages/search/music_search_controller.dart';
import 'package:apple_music_app/pages/search/view/child/search_result_view/child/search_result_cell.dart';
import 'package:apple_music_app/util/noting_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResultView extends GetView<MusicSearchController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: "SearchResultView",
      init: controller,
      builder: (value) {
        return bodyListView();
      },
    );
  }

  Widget bodyListView() {
    return resultView();
  }

  Widget resultView() {
    if (controller.searchResult.value.trackList?.isEmpty ?? true) {
      return NothingView();
    } else {
      return Column(children: [Expanded(child: resulecrollView())]);
    }
  }

  Widget resulecrollView() {
    return CustomScrollView(slivers: <Widget>[sliverListResult()]);
  }

  SliverList sliverListResult() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        TrackModel model = controller.searchResult.value.trackList![index];

        return SearchResultCell(model: model, onClick: () {});
      }, childCount: controller.searchResult.value.trackList!.length),
    );
  }
}
