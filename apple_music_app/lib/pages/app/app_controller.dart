import 'package:apple_music_app/api/huuua_api_repository.dart';
import 'package:apple_music_app/config/huuua_config.dart';
import 'package:apple_music_app/pages/home/home_controller.dart';
import 'package:apple_music_app/util/util.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  final AbStractHuuuaApiRepository repository;
  AppController({required this.repository});

  var selectedIndex = 1.obs;
  var showBottomNavigationBar = true.obs;
  var netType = NetType.normal.obs; //网络是否正常

  BuildContext? homecontext;
  /////  CD     ////////

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    checkNet();
    print('AppHomeController onReady....................');
  }

  void changeShowSelectedView(int index) {
    selectedIndex.value = index;
    updateAppView();
  }

  void updateAppView() {
    update(['AppView']);
  }

  void checkNet() async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      // I am connected to a mobile network.
      devLog("蜂窝网络");
      netType.value = NetType.yesNet;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      // I am connected to a wifi network.
      devLog("wifi连接");
      netType.value = NetType.yesNet;
    } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
      // I am connected to a ethernet network.
      devLog("以太网");
      netType.value = NetType.noNet;
    } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
      // I am connected to a vpn network.
      // Note for iOS and macOS:
      // There is no separate network interface type for [vpn].
      // It returns [other] on any device (also simulator)
      devLog("vpn连接");
      netType.value = NetType.noNet;
    } else if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
      // I am connected to a bluetooth.
      devLog("蓝牙连接");
      netType.value = NetType.noNet;
    } else if (connectivityResult.contains(ConnectivityResult.other)) {
      // I am connected to a network which is not in the above mentioned networks.
      devLog("未知网络连接");
      netType.value = NetType.noNet;
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      // I am not connected to any network.
      devLog("没有网络");
      netType.value = NetType.noNet;
      update(['AppView']);
    }

    if (netType.value == NetType.yesNet) {
      Get.lazyPut(() => HomeController(repository: Get.find()));
      update(['AppView']);
    }
  }
}
