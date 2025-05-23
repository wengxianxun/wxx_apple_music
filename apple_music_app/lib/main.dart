import 'dart:io';
import 'dart:ui';

import 'package:apple_music_app/api/huuua_api_provider.dart';
import 'package:apple_music_app/api/huuua_api_repository.dart';
import 'package:apple_music_app/config/Persistence.dart';
import 'package:apple_music_app/config/huuua_logger.dart';
import 'package:apple_music_app/config/huuua_translate.dart';
import 'package:apple_music_app/pages/app/app_controller.dart';
import 'package:apple_music_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'config/huuua_theme.dart' show HuuuaThemeDark, HuuuaThemeLight;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// 初始化本地存储
  await Persistence.init();

  runApp(MyApp());
  if (Platform.isIOS) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  } else {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          translations: HuuuaTranslate(),
          locale: PlatformDispatcher.instance.locale,
          // locale: Locale('en', 'US'),
          theme: HuuuaThemeLight,
          darkTheme: HuuuaThemeDark,
          debugShowCheckedModeBanner: false,
          enableLog: true,
          logWriterCallback: Logger.write,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          // builder: (BuildContext context, Widget? child) {
          //   //设置整体字体大小， iOS和安卓需要区分对待
          //   return MediaQuery(
          //     data: MediaQuery.of(context).copyWith(
          //         textScaleFactor: Platform.isIOS ? 1.5 : 1.0,
          //         boldText: false),
          //     child: child!,
          //   );
          // },
          onInit: () {
            Get.put<AbstractHuuuaApiProvider>(
              HuuuaApiProvider(),
              permanent: true,
            );
            Get.put<AbStractHuuuaApiRepository>(
              HuuuaApiRepository(provider: Get.find()),
              permanent: true,
            );

            Get.lazyPut(() => AppController(repository: Get.find()));
          },
          routingCallback: (routing) {},
        );
      },
    );
  }
}
