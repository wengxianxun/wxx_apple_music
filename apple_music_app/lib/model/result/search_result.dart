import 'dart:convert';

import 'package:apple_music_app/config/huuua_config.dart';
import 'package:apple_music_app/model/track_model.dart';

class SearchResult {
  final List<TrackModel>? trackList; //音乐model
  int offset = 0;
  int limit = 200;
  LoadType loadType = LoadType.normal;
  SearchResult({this.trackList});

  static SearchResult fromRawJson(dynamic jsonresult) {
    return SearchResult.fromJson(json.decode(jsonresult));
  }

  static SearchResult fromJson(dynamic jsonresult) {
    final jsonData = jsonresult['results'];

    List<TrackModel>? list = [];

    for (var i = 0; i < jsonData.length; i++) {
      Map<String, dynamic> map = jsonData[i];
      TrackModel trackModel = TrackModel.fromJson(map);
      list.add(trackModel);
    }

    return SearchResult(trackList: list);
  }

  void appendList(SearchResult moreResult) {
    if (this.trackList != null) {
      this.trackList!.addAll(moreResult.trackList!);
    }
  }

  void resetResult() {
    offset = 0;

    if (trackList != null) {
      trackList!.clear();
    }
  }
}
