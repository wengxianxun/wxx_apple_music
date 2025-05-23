import 'package:apple_music_app/api/huuua_api_repository.dart';
import 'package:apple_music_app/config/huuua_ui_config.dart';
import 'package:apple_music_app/model/result/music_result.dart';
import 'package:apple_music_app/util/util.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController {
  final AbStractHuuuaApiRepository repository;
  HomeController({required this.repository});

  var musicResult = MusicResult().obs;
  RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );
  String title = 'home';
  @override
  void onInit() {
    super.onInit();
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

    // 刷新searchbibleview
    update(["HomeView"]);
  }
}
