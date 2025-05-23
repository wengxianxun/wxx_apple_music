import 'package:apple_music_app/api/huuua_api_repository.dart';
import 'package:apple_music_app/config/huuua_config.dart';
import 'package:apple_music_app/config/huuua_ui_config.dart';
import 'package:apple_music_app/model/result/search_result.dart';
import 'package:apple_music_app/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

const String kKeywordHistory = 'kKeywordHistory';
const String kSearchBibleView = 'kSearchBibleView';
const String kSearchLanguageView = 'kSearchLanguageView';
const String kSearchContryView = 'kSearchContryView';

class MusicSearchController extends GetxController
    with StateMixin<SearchResult> {
  final AbStractHuuuaApiRepository repository;
  var searchText = ''.obs;
  String searchTextValue = '';
  MusicSearchController({required this.repository});

  final PageController pageController = PageController(initialPage: 0);

  TextEditingController? textEditingController = TextEditingController();

  // late SharedPreferences _prefs;
  var keywordHistoryList = [].obs;
  bool isSearching = false;

  var searchResult = SearchResult().obs;

  int defaultIndexPage = 0;

  SearchType selectedSearchType = SearchType.bible;
  RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );
  Map<int, String> segmentlist = {
    SearchType.bible.number: SearchType.bible.value,
    SearchType.language.number: SearchType.language.value,
    SearchType.country.number: SearchType.country.value,
  };

  @override
  void onInit() {
    super.onInit();

    var arg = Get.arguments;

    defaultIndexPage = arg == null ? 0 : Get.arguments['defaultIndexPage'];
    // _prefs = Persistence.sharedPreferences;
    // initKeywordHistory();
    change(SearchResult(), status: RxStatus.empty());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    // reqBibles();
  }

  void changeDefaultIndexPage(int page) {
    defaultIndexPage = page;
    pageController.animateToPage(
      page,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 200),
    );
  }

  // // 搜索关键字
  void searchKeyword() {
    if (searchText.value.isEmpty) {
      devLog("输入为空");
    } else {
      searchTextValue = searchText.value;
      searchTextValue = searchTextValue.trim(); //去掉前后空格
      searchTextValue = searchTextValue.replaceAll(RegExp(r"\s+\b|\b\s"), "+");

      searchResult.value.resetResult();
      searchMusic();
    }
  }

  // 搜索圣经
  void searchMusic() {
    searchResult.value.loadType = LoadType.loading;
    showLoadingDialog();
    // 开始查询
    repository
        .searchMusic(
          term: searchTextValue,
          limit: searchResult.value.limit,
          media: 'music',
          offset: searchResult.value.offset,
        )
        .then(
          (value) {
            changeMusicResult(value);
            devLog("message");
          },
          onError: (err) {
            devLog("错误${err}");
            hideLoadingDialog();
            showTipDialog(title: "网络错误", content: "$err");

            update(["SearchResultView"]);
          },
        );
  }

  void changeMusicResult(SearchResult result) {
    if (searchResult!.value.offset <= 0) {
      searchResult.value = result;
    } else {
      // musicResult!.value.offset = result.current_page;
      searchResult!.value.appendList(result);
    }

    if ((result.trackList?.length ?? 0) < searchResult.value.limit) {
      refreshController.loadNoData();
    } else {
      refreshController.loadComplete();
    }

    // 刷新searchbibleview
    update(["SearchResultView"]);
    hideLoadingDialog();
  }

  // void reqBibles() {
  //   if (bibleResult.value.biblesList != null &&
  //       bibleResult.value.biblesList!.length > 0) {
  //     bibleResult.value.loadType = LoadType.loadsuccess;
  //     // 刷新searchbibleview
  //     update([kSearchBibleView]);
  //     return;
  //   }
  //
  //   String? iso = Persistence.sharedPreferences.getString(kLanguageCode);
  //   bibleResult.value.loadType = LoadType.loading;
  //   update([kSearchBibleView]);
  //   repository
  //       .getBiblesList4LanguageCode(
  //         languageCode: iso!,
  //         page: bibleResult.value.current_page,
  //       )
  //       .then(
  //         (value) {
  //           changeBiblesResult(value);
  //
  //           devLog("message");
  //         },
  //         onError: (err) {
  //           bibleResult.value.loadType = LoadType.loaderror;
  //           devLog("错误");
  //         },
  //       );
  // }
  //
  // void reqMoreSearchBiblesList() {
  //   if (search_bibleResult!.value.current_page > 0 &&
  //       search_bibleResult!.value.current_page ==
  //           search_bibleResult!.value.last_page) {
  //     biblerefreshController.loadNoData();
  //     return;
  //   }
  //   search_bibleResult!.value.current_page += 1;
  //   searchBibles();
  // }
  //
  // void reqMoreBiblesList() {
  //   if (bibleResult!.value.current_page > 0 &&
  //       bibleResult!.value.current_page == bibleResult!.value.last_page) {
  //     biblerefreshController.loadNoData();
  //     return;
  //   }
  //   bibleResult!.value.current_page += 1;
  //   reqBibles();
  // }
  //
  // void changeBiblesResult(BiblesResult result) {
  //   if (bibleResult!.value.current_page <= 0) {
  //     bibleResult.value = result;
  //   } else {
  //     bibleResult!.value.current_page = result.current_page;
  //     bibleResult!.value.appendList(result);
  //   }
  //
  //   if (bibleResult.value.current_page >= bibleResult.value.last_page) {
  //     biblerefreshController.loadNoData();
  //   } else {
  //     biblerefreshController.loadComplete();
  //   }
  //   bibleResult.value.loadType = LoadType.loadsuccess;
  //   // 刷新searchbibleview
  //   update([kSearchBibleView]);
  // }
  //
  // // 搜索圣经结果处理
  // void changeSearchBiblesResult(BiblesResult result) {
  //   if (search_bibleResult!.value.current_page <= 0) {
  //     search_bibleResult.value = result;
  //   } else {
  //     search_bibleResult!.value.current_page = result.current_page;
  //     search_bibleResult!.value.appendList(result);
  //   }
  //
  //   if (search_bibleResult.value.current_page >=
  //       search_bibleResult.value.last_page) {
  //     biblerefreshController.loadNoData();
  //   } else {
  //     biblerefreshController.loadComplete();
  //   }
  //   search_bibleResult.value.loadType = LoadType.loadsuccess;
  //   // 刷新searchbibleview
  //   update([kSearchBibleView]);
  // }
  //
  // // 初始化历史搜索记录
  // void initKeywordHistory() {
  //   String? keywordHistoryvalue = _prefs.getString(kKeywordHistory);
  //   if (keywordHistoryvalue != null && keywordHistoryvalue.isNotEmpty) {
  //     keywordHistoryList.value = List<String>.from(
  //       jsonDecode(keywordHistoryvalue),
  //     );
  //   } else {}
  // }
  //
  // // 增加历史搜索记录
  // void addKeywordHistory(String keyword) {
  //   if (keyword.isNotEmpty && !keywordHistoryList.contains(keyword)) {
  //     keywordHistoryList.add(keyword);
  //     _prefs.setString(kKeywordHistory, jsonEncode(keywordHistoryList));
  //   }
  // }
  //
  // // 清空搜索历史
  // void cleanAllKeywordHistory() {
  //   _prefs.setString(kKeywordHistory, '');
  //   keywordHistoryList.clear();
  //   devLog("历史列表${keywordHistoryList.length}");
  // }
  //
  // void deleteKeywordHistory(String keywordarg) {
  //   keywordHistoryList.remove(keywordarg);
  //   _prefs.setString(kKeywordHistory, jsonEncode(keywordHistoryList));
  // }
  //
  // // 清空搜索结果
  // void cleanResult() {
  //   change(SearchResult(), status: RxStatus.empty());
  // }
  //

  //

  void updateSearchView() {
    update([kSearchBibleView]);
    update([kSearchLanguageView]);
    update([kSearchContryView]);
  }
}
