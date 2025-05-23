import 'package:apple_music_app/model/result/music_result.dart';
import 'package:apple_music_app/model/result/search_result.dart';

import 'huuua_api_provider.dart';

abstract class AbStractHuuuaApiRepository {
  Future<MusicResult> getMusicList({
    required String term,
    required int limit,
    required String media,
    required int offset,
  });

  Future<SearchResult> searchMusic({
    required String term,
    required int limit,
    required String media,
    required int offset,
  });
}

class HuuuaApiRepository implements AbStractHuuuaApiRepository {
  final AbstractHuuuaApiProvider provider;

  HuuuaApiRepository({required this.provider});

  @override
  Future<MusicResult> getMusicList({
    required String term,
    required int limit,
    required String media,
    required int offset,
  }) async {
    // Talyor+Swift
    final list = await provider.getMusicList(
      "search?term=$term&limit=$limit&media=$media&offset=$offset",
    );
    if (list.status.hasError) {
      return Future.error(list.statusText!);
    } else {
      return list.body!;
    }
  }

  @override
  Future<SearchResult> searchMusic({
    required String term,
    required int limit,
    required String media,
    required int offset,
  }) async {
    // Talyor+Swift
    final list = await provider.searchMusic(
      "search?term=$term&limit=$limit&media=$media&offset=$offset",
    );
    if (list.status.hasError) {
      return Future.error(list.statusText!);
    } else {
      return list.body!;
    }
  }
}
