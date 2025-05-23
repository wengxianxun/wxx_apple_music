import 'package:apple_music_app/pages/app/app_binding.dart';
import 'package:apple_music_app/pages/app/view/app_view.dart';
import 'package:apple_music_app/pages/search/music_search_binding.dart';
import 'package:apple_music_app/pages/search/view/music_search_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.AppView;

  static final routes = [
    GetPage(name: Routes.AppView, page: () => AppView(), binding: AppBinding()),

    GetPage(
      name: Routes.MusicSearchView,
      page: () => MusicSearchView(),
      binding: MusicSearchBinding(),
    ),
  ];
}
