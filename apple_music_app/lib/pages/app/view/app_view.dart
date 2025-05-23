import 'package:apple_music_app/config/huuua_config.dart';
import 'package:apple_music_app/pages/app/app_controller.dart';
import 'package:apple_music_app/pages/app/view/child/app_lunch_view.dart';
import 'package:apple_music_app/pages/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppView extends GetView<AppController> {
  // final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    controller.homecontext ??= context;
    print(
      "Get.context!.mediaQueryPadding.bottom${Get.context!.mediaQueryPadding.bottom}",
    );
    return GetBuilder(
      id: "AppView",
      init: controller,
      builder: (value) {
        return bodyView();
      },
    );
  }

  Widget bodyView() {
    if (controller.netType.value == NetType.yesNet) {
      return mainView();
    } else {
      return launchView();
    }
  }

  Widget launchView() {
    return AppLunchView(
      appController: controller,
      onOpenCallBack: () {
        //隐藏lunch,打开小说tab界面
        // controller.openView();
      },
    );
  }

  Widget mainView() {
    return Scaffold(
      extendBody: false,
      // resizeToAvoidBottomInset: false,
      body: HomeView(),

      // AnimatedContainer(
      //   color: Colors.teal,
      //   duration: const Duration(milliseconds: 200),
      //   height: controller.showBottomNavigationBar.value
      //       ? kBottomNavigationBarHeight + Get.mediaQuery.padding.bottom
      //       : 0.0,
      //   child: ,
      // ),
    );
  }
}
