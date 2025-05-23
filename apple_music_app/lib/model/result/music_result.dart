import 'dart:convert';

import 'package:apple_music_app/model/track_model.dart';

class MusicResult {
  final List<TrackModel>? trackList; //音乐model

  int offset = 0;
  int limit = 200;
  MusicResult({this.trackList});

  static MusicResult fromRawJson(dynamic jsonresult) {
    return MusicResult.fromJson(json.decode(jsonresult));
  }

  static MusicResult fromJson(dynamic jsonresult) {
    final jsonData = jsonresult['results'];

    List<TrackModel>? list = [];

    for (var i = 0; i < jsonData.length; i++) {
      Map<String, dynamic> map = jsonData[i];
      TrackModel trackModel = TrackModel.fromJson(map);
      list.add(trackModel);
    }

    return MusicResult(trackList: list);
  }

  void appendList(MusicResult moreResult) {
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
