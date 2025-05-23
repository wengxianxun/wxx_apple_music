import 'package:apple_music_app/pages/app/app_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController(repository: Get.find()));
  }
}
