import 'package:apple_music_app/api/huuua_api_repository.dart';
import 'package:apple_music_app/config/huuua_ui_config.dart';
import 'package:apple_music_app/model/result/music_result.dart';
import 'package:apple_music_app/model/track_model.dart';
import 'package:apple_music_app/util/util.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
enum SortType {
  trackName,  // 按歌曲名称排序
  collectionName  // 按专辑名称排序
}
class HomeController extends GetxController {
  final AbStractHuuuaApiRepository repository;
  HomeController({required this.repository});
  final searchKeyword = ''.obs; // 搜索关键词响应式变量
  final filteredTrackList = <TrackModel>[].obs; // 过滤后的歌曲列表
  var musicResult = MusicResult().obs;
  RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );
  String title = 'home';
  // ... 原有变量 ...
  final sortType = SortType.trackName.obs;  // 默认按歌曲名称排序
  @override
  void onInit() {
    super.onInit();

    ever(searchKeyword, (_) => _filterAndSortTracks());
    // 初始加载完成后执行一次过滤
    ever(sortType, (_) => _filterAndSortTracks());
    _filterAndSortTracks();
  }

  void _filterAndSortTracks() {
    // 先过滤
    final filtered = musicResult.value.trackList?.where((track) {
          final trackName = track.trackName?.toLowerCase() ?? '';
          final collectionName = track.collectionName?.toLowerCase() ?? '';
          return trackName.contains(searchKeyword.value.toLowerCase()) 
              || collectionName.contains(searchKeyword.value.toLowerCase());
        })?.toList() ?? [];

    // 再排序
    switch(sortType.value) {
      case SortType.trackName:
        filtered.sort((a, b) => (a.trackName ?? '').compareTo(b.trackName ?? ''));
        break;
      case SortType.collectionName:
        filtered.sort((a, b) => (a.collectionName ?? '').compareTo(b.collectionName ?? ''));
        break;
    }

    filteredTrackList.value = filtered;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    print('AppHomeController onReady....................');

    reqMusicResult();
  }

  void reqMusicResult() {
    repository
        .getMusicList(
          term: 'Talyor+Swift',
          limit: musicResult.value.limit,
          media: 'music',
          offset: musicResult.value.offset,
        )
        .then(
          (value) {
            changeMusicResult(value);
            devLog("message");
          },
          onError: (err) {
            showTipDialog(title: "网络错误", content: "$err");
            devLog("错误");
          },
        );
  }

  void reqMoreMusicResult() {
    musicResult.value.offset += musicResult.value.limit;
    repository
        .getMusicList(
          term: 'Talyor+Swift',
          limit: musicResult.value.limit,
          media: 'music',
          offset: musicResult.value.offset,
        )
        .then(
          (value) {
            changeMusicResult(value);
            devLog("message");
          },
          onError: (err) {
            showTipDialog(title: "网络错误", content: "$err");
            devLog("错误");
          },
        );
  }

  void changeMusicResult(MusicResult result) {
    if (musicResult!.value.offset <= 0) {
      musicResult.value = result;
    } else {
      // musicResult!.value.offset = result.current_page;
      musicResult!.value.appendList(result);
    }

    if ((result.trackList?.length ?? 0) < musicResult.value.limit) {
      refreshController.loadNoData();
    } else {
      refreshController.loadComplete();
    }
    filteredTrackList.value = musicResult.value.trackList ?? [];
    // 刷新searchbibleview
    update(["HomeView"]);
  }
}
