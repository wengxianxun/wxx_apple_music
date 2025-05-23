import 'package:apple_music_app/model/result/music_result.dart';
import 'package:apple_music_app/model/result/search_result.dart';
import 'package:get/get.dart';

// const String key = 'a92ecf9f-c630-48d1-85f3-55a15b094f5a';
const String key = '52e62d4c-f7c8-4a8b-9008-8634d0fbddb0';

// ignore: one_member_abstracts
abstract class AbstractHuuuaApiProvider {
  // 获取音乐列表
  Future<Response<MusicResult>> getMusicList(String path);

  // 搜索音乐
  Future<Response<SearchResult>> searchMusic(String path);
}

class HuuuaApiProvider extends GetConnect implements AbstractHuuuaApiProvider {
  @override
  void onInit() {
    httpClient.timeout = Duration(seconds: 15);

    // https://itunes.apple.com/search?term=Talyor+Swift&limit=200&media=music
    httpClient.baseUrl = 'https://itunes.apple.com/';
  }

  @override
  Future<Response<MusicResult>> getMusicList(String path) {
    httpClient.defaultDecoder = MusicResult.fromRawJson;

    return get(path);
  }

  @override
  Future<Response<SearchResult>> searchMusic(String path) {
    httpClient.defaultDecoder = SearchResult.fromRawJson;

    return get(path);
  }
}
