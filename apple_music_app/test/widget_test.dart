// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:apple_music_app/api/huuua_api_repository.dart';
import 'package:apple_music_app/model/result/search_result.dart';
import 'package:apple_music_app/model/track_model.dart';
import 'package:apple_music_app/pages/search/view/child/search_result_view/child/search_result_cell.dart';
import 'package:apple_music_app/pages/search/view/music_search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

// 模拟 API 仓库
class MockHuuuaApiRepository extends Mock
    implements AbStractHuuuaApiRepository {}

void main() {
  group('Search Functionality Tests', () {
    late MockHuuuaApiRepository mockRepository;

    setUp(() {
      mockRepository = MockHuuuaApiRepository();
      // 注册模拟仓库到 GetX 依赖注入
      Get.put<AbStractHuuuaApiRepository>(mockRepository);
    });

    tearDown(() {
      Get.reset();
    });

    testWidgets('Search page initial state test', (WidgetTester tester) async {
      // 构建搜索页面
      await tester.pumpWidget(GetMaterialApp(home: MusicSearchView()));
      await tester.pumpAndSettle(); // 等待页面渲染完成

      // 验证搜索框存在
      expect(find.byType(TextField), findsOneWidget);

      // 验证初始状态显示搜索历史标签（根据项目国际化配置）
      expect(find.text('search_history'.tr), findsOneWidget);
    });

    testWidgets('Search functionality with mock data', (
      WidgetTester tester,
    ) async {
      // 模拟搜索返回数据（完整初始化所有 TrackModel 属性）
      final mockTracks = [
        TrackModel(
          artworkUrl100: 'test_url', // 专辑封面图 URL
          trackName: 'Test Track 1', // 歌曲名称
          wrapperType: 'track', // 数据包装类型（track/collection 等）
          kind: 'song', // 内容类型（song/music-video 等）
          artistId: 1, // 艺术家 ID
          collectionId: 2, // 专辑 ID
          trackId: 3, // 歌曲 ID
          collectionName: 'Test Collection', // 专辑名称
          artistName: 'Test Artist', // 艺术家名称
          releaseDate: DateTime(2023, 1, 1), // 发行日期
          trackTimeMillis: 240000, // 歌曲时长（毫秒）
          previewUrl: 'test_preview_url', // 预览音频链接
          country: 'US', // 发行国家
          currency: 'USD', // 货币类型
          primaryGenreName: 'Pop', // 主要音乐类型
          collectionPrice: 10.99, // 专辑价格
          trackPrice: 5.99, // 歌曲价格
          collectionExplicitness: 'notExplicit', // 专辑是否包含明确内容
          trackExplicitness: 'notExplicit', // 歌曲是否包含明确内容
          discCount: 1, // 专辑中的碟片数量
          discNumber: 1, // 当前碟片的序号
          trackCount: 10, // 专辑中的歌曲数量
          trackNumber: 1, // 当前歌曲在专辑中的序号
          trackViewUrl: 'test_track_view_url', // 歌曲详情页面链接
          artworkUrl60: 'test_artwork_url_60', // 专辑封面图 URL（60x60 像素）
          collectionCensoredName: 'Test Collection', // 专辑名称（可能已被过滤）
          trackCensoredName: 'Test Track 1',
          artistViewUrl: '',
          collectionViewUrl: '',
          artworkUrl30: '',
          isStreamable: true,
        ),
      ];
      when(
        mockRepository.searchMusic(
          term: 'test',
          limit: 200,
          media: 'media',
          offset: 0,
        ),
      ).thenAnswer((_) async => SearchResult(trackList: mockTracks));

      // 构建搜索页面
      await tester.pumpWidget(GetMaterialApp(home: MusicSearchView()));
      await tester.pumpAndSettle();

      // 输入搜索词并提交
      await tester.enterText(find.byType(TextField), 'test');
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pumpAndSettle(); // 等待搜索请求和渲染完成

      // 修正断言：mockTracks 包含 1 条数据，应验证找到 1 个 SearchResultCell
      expect(find.byType(SearchResultCell), findsNWidgets(1));
      expect(find.text('Test Track 1'), findsOneWidget);
      expect(find.text('Test Artist'), findsOneWidget); // 验证艺术家名称渲染
    });
  });
}
