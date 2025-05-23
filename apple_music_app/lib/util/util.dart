import 'dart:async';
import 'dart:developer' as developer;

import 'package:apple_music_app/config/huuua_config.dart';

/// 本应用的工具
class Util {
  /// 获取本地图片地址
  static String assetImage(String fileName) {
    return "assets/images/" + fileName;
  }
}

/// 输出中包括更多的粒度和信息。
/// https://flutter.dev/docs/testing/code-debugging
void devLog(
  String message, {
  DateTime? time,
  int? sequenceNumber,
  int level = 0,
  String name = '',
  Zone? zone,
  Object? error,
  StackTrace? stackTrace,
}) {
  if (!kDebugMode) return;
  developer.log(
    message,
    time: time,
    sequenceNumber: sequenceNumber,
    level: level,
    name: name,
    zone: zone,
    error: error,
    stackTrace: stackTrace,
  );
}
