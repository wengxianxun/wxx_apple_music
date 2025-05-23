import 'package:get/get.dart';

/// 开发环境开关
const bool kDebugMode = true;

// const String serverHost = 'http://192.168.31.179/wxxserver/wxxapiserver';

const String serverHost = 'https://www.huuua.com/wxxapiserver';

/// 接口服务器的域名
const String novelServerBaseUrl = '$serverHost/index.php?';

enum target_type {
  bible_chapter('bible_chapter', 0); //圣经章节评论

  const target_type(this.value, this.number);
  final String value;
  final int number;
}

// 加载状态
enum HuuuaLoadState { loading, success, failed, empty, normal }

enum SearchType {
  bible("bible", 0),
  language('language', 1),
  country('country', 2);

  const SearchType(this.value, this.number);
  final String value;
  final int number;
}

enum LoadType { normal, loading, loadsuccess, loaderror }

const bool inProduction = const bool.fromEnvironment("dart.vm.product");

enum NetType { normal, noNet, yesNet }

enum flavors_type {
  flavor_huuua,
  flavor_wxx,
  flavor_hot,
  flavor_transsion,
  flavor_ibible,
}

enum admob_type {
  admob_setting_banner, //设置banner
  admob_index_banner, //首页banner
  admob_bible_banner, //圣经页面
  admob_movie_banner, //视频播放
  admob_read_banner, //阅读界面
  admob_splash, //开屏
}

class HuuuaConfig {
  static HuuuaConfig _config = HuuuaConfig();
  static HuuuaConfig get instance => getInstance();
  late final flavors_type flavorstype;
  static final showAd = true;
  //获取单例
  static HuuuaConfig getInstance() {
    _config ??= HuuuaConfig();
    return _config;
  }

  void setFlavorsType(flavors_type type) {
    flavorstype = type;
  }

  String getLogoPath() {
    return HuuuaConfig.getInstance().flavorstype == flavors_type.flavor_ibible
        ? "assets/images/hotlogo.png"
        : "assets/images/wxxlogo.png";
  }

  //发送事件
  String getAdmobBannerId(admob_type type) {
    if (inProduction) {
      //

      if (HuuuaConfig.instance.flavorstype == flavors_type.flavor_wxx ||
          HuuuaConfig.instance.flavorstype == flavors_type.flavor_ibible) {
        /// 正式
        switch (type) {
          case admob_type.admob_setting_banner:
            return GetPlatform.isAndroid
                ? 'ca-app-pub-5914587552835750/9309220636'
                : 'ca-app-pub-5914587552835750/1822308353';
            break;
          case admob_type.admob_index_banner:
            return GetPlatform.isAndroid
                ? 'ca-app-pub-5914587552835750/3351522221'
                : 'ca-app-pub-5914587552835750/5442715519';
            break;
          case admob_type.admob_bible_banner:
            return GetPlatform.isAndroid
                ? 'ca-app-pub-5914587552835750/1807052404'
                : 'ca-app-pub-5914587552835750/4692014277';
            break;
          case admob_type.admob_movie_banner:
            return GetPlatform.isAndroid
                ? 'ca-app-pub-5914587552835750/2517123486'
                : 'ca-app-pub-5914587552835750/2334673547';
            break;
          case admob_type.admob_read_banner:
            return GetPlatform.isAndroid
                ? 'ca-app-pub-5914587552835750/1320086722'
                : 'ca-app-pub-5914587552835750/1388369488';
            break;
          case admob_type.admob_splash:
            return GetPlatform.isAndroid
                ? 'ca-app-pub-5914587552835750~7798179484'
                : 'ca-app-pub-5914587552835750~7798179484';
            break;
        }
      } else if (HuuuaConfig.instance.flavorstype ==
          flavors_type.flavor_huuua) {
        /// 正式
        switch (type) {
          case admob_type.admob_setting_banner:
            return GetPlatform.isAndroid
                ? 'ca-app-pub-5914587552835750/9340531291'
                : 'ca-app-pub-5914587552835750/9340531291';
            break;
          case admob_type.admob_index_banner:
            return GetPlatform.isAndroid
                ? 'ca-app-pub-5914587552835750/7722012076'
                : 'ca-app-pub-5914587552835750/7722012076';
            break;
          case admob_type.admob_bible_banner:
            return GetPlatform.isAndroid
                ? 'ca-app-pub-5914587552835750/6241121433'
                : 'ca-app-pub-5914587552835750/6241121433';
            break;
          case admob_type.admob_movie_banner:
            return GetPlatform.isAndroid
                ? 'ca-app-pub-5914587552835750/3080779008'
                : 'ca-app-pub-5914587552835750/3080779008';
            break;
          case admob_type.admob_read_banner:
            return GetPlatform.isAndroid
                ? 'ca-app-pub-5914587552835750/6959426211'
                : 'ca-app-pub-5914587552835750/1388369488';
            break;
          case admob_type.admob_splash:
            return GetPlatform.isAndroid
                ? 'ca-app-pub-5914587552835750~5840269989'
                : 'ca-app-pub-5914587552835750~5840269989';
            break;
        }
      } else if (HuuuaConfig.instance.flavorstype == flavors_type.flavor_hot) {
        /// 正式
        switch (type) {
          case admob_type.admob_setting_banner:
            return GetPlatform.isAndroid
                ? 'ca-app-pub-5914587552835750/4820781171'
                : 'ca-app-pub-5914587552835750/4820781171';
            break;
          case admob_type.admob_index_banner:
            return GetPlatform.isAndroid
                ? 'ca-app-pub-5914587552835750/2981085891'
                : 'ca-app-pub-5914587552835750/2981085891';
            break;
          case admob_type.admob_bible_banner:
            return GetPlatform.isAndroid
                ? 'ca-app-pub-5914587552835750/3962957081'
                : 'ca-app-pub-5914587552835750/3962957081';
            break;
          case admob_type.admob_movie_banner:
            return GetPlatform.isAndroid
                ? 'ca-app-pub-5914587552835750/9881536167'
                : 'ca-app-pub-5914587552835750/9881536167';
            break;
          case admob_type.admob_read_banner:
            return GetPlatform.isAndroid
                ? 'ca-app-pub-5914587552835750/1755634131'
                : 'ca-app-pub-5914587552835750/1755634131';
            break;
          case admob_type.admob_splash:
            return GetPlatform.isAndroid
                ? 'ca-app-pub-5914587552835750/8073630472'
                : 'ca-app-pub-5914587552835750/8073630472';
            break;
        }
      }
    } else if (HuuuaConfig.instance.flavorstype ==
        flavors_type.flavor_transsion) {
      /// 正式
      switch (type) {
        case admob_type.admob_setting_banner:
          return GetPlatform.isAndroid
              ? 'ca-app-pub-5914587552835750/8935210022'
              : 'ca-app-pub-5914587552835750/8935210022';
          break;
        case admob_type.admob_index_banner:
          return GetPlatform.isAndroid
              ? 'ca-app-pub-5914587552835750/7572530039'
              : 'ca-app-pub-5914587552835750/2981085891';
          break;
        case admob_type.admob_bible_banner:
          return GetPlatform.isAndroid
              ? 'ca-app-pub-5914587552835750/4010186407'
              : 'ca-app-pub-5914587552835750/3962957081';
          break;
        case admob_type.admob_movie_banner:
          return GetPlatform.isAndroid
              ? 'ca-app-pub-5914587552835750/4946366692'
              : 'ca-app-pub-5914587552835750/9881536167';
          break;
        case admob_type.admob_read_banner:
          return GetPlatform.isAndroid
              ? 'ca-app-pub-5914587552835750/7315006592'
              : 'ca-app-pub-5914587552835750/1755634131';
          break;
        case admob_type.admob_splash:
          return GetPlatform.isAndroid
              ? 'ca-app-pub-5914587552835750/4581032045'
              : 'ca-app-pub-5914587552835750/8073630472';
          break;
      }
    } else {
      /// 测试id
      switch (type) {
        case admob_type.admob_setting_banner:
          return GetPlatform.isAndroid
              ? 'ca-app-pub-3940256099942544/6300978111'
              : 'ca-app-pub-3940256099942544/2934735716';
          break;
        case admob_type.admob_bible_banner:
          return GetPlatform.isAndroid
              ? 'ca-app-pub-3940256099942544/6300978111'
              : 'ca-app-pub-3940256099942544/2934735716';
          break;
        case admob_type.admob_index_banner:
          return GetPlatform.isAndroid
              ? 'ca-app-pub-3940256099942544/6300978111'
              : 'ca-app-pub-3940256099942544/2934735716';
          break;
        case admob_type.admob_movie_banner:
          return GetPlatform.isAndroid
              ? 'ca-app-pub-3940256099942544/6300978111'
              : 'ca-app-pub-3940256099942544/2934735716';
          break;
        case admob_type.admob_read_banner:
          return GetPlatform.isAndroid
              ? 'ca-app-pub-3940256099942544/6300978111'
              : 'ca-app-pub-3940256099942544/2934735716';
          break;
        case admob_type.admob_splash:
          return GetPlatform.isAndroid
              ? 'ca-app-pub-3940256099942544/9257395921'
              : 'ca-app-pub-3940256099942544/5575463023';
          break;
      }
    }
    return "";
  }

  ///枚举类型转string
  String enumToString(o) => o.toString().split('.').last;

  ///string转枚举类型
  T enumFromString<T>(Iterable<T> values, String value) {
    // ,orElse: () => null
    return values.firstWhere(
      (type) => type.toString().split('.').last == value,
    );
  }
}
