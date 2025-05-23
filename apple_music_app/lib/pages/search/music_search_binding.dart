import 'package:apple_music_app/pages/search/music_search_controller.dart';
import 'package:get/get.dart';

class MusicSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MusicSearchController(repository: Get.find()));
  }
}
