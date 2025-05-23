// import 'dart:convert';
//
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:wxx_bible_app/api/huuua_api_repository.dart';
// import 'package:wxx_bible_app/config/Persistence.dart';
// import 'package:wxx_bible_app/model/result/user_result.dart';
// import 'package:wxx_bible_app/model/user_model.dart';
//
// const String kUserModel = 'kUserModel';
// const String kUser = 'user';
// const String kUserId = 'user_id';
// const String kAccessToken = 'accessToken';
//
// class UserManager {
//   // 工厂模式
//   factory UserManager() => _getInstance();
//   static UserManager get instance => _getInstance();
//   static UserManager? _instance;
//   static UserManager _getInstance() {
//     _instance ??= UserManager._internal();
//     return _instance!;
//   }
//
//   late SharedPreferences _prefs;
//   UserModel? userModel;
//   final AbStractHuuuaApiRepository repository = Get.find();
//   UserManager._internal() {
//     // 初始化
//     _prefs = Persistence.sharedPreferences;
//   }
//
//   Future<bool> updateUserInfo() async {
//     UserResult userResult = await repository.getUserInfo(
//       user_id: userModel!.user_id!,
//     );
//
//     setUserModel(userResult.userModel!);
//
//     return isLogin();
//   }
//
//   // 默认登录
//   Future<bool> defaultLogin() async {
//     String? jsonvalue = _prefs.getString(kUserModel);
//     if (jsonvalue != null && jsonvalue.isNotEmpty) {
//       userModel = UserModel.fromJson(jsonDecode(jsonvalue));
//       await updateUserInfo();
//     } else {
//       //游客登录
//       // UserResult userResult = await repository.userVisitorLogin();
//       // print('游客id:${userResult.userModel!.user_id}');
//       // print('游客device_id:${userResult.userModel!.device_id}');
//       // setNovelUserModel(userResult.userModel!);
//     }
//     return isLogin();
//   }
//
//   // 非游客登录： facebook/goole等
//   bool isLogin() {
//     if (userModel != null &&
//         userModel!.google_id != null &&
//         userModel!.google_id!.isNotEmpty) {
//       return true;
//     }
//     if (userModel != null &&
//         userModel!.facebook_userId != null &&
//         userModel!.facebook_token!.isNotEmpty) {
//       return true;
//     }
//     return false;
//   }
//
//   // 退出登录
//   void logout() {
//     userModel = null;
//     _prefs.remove(kUserModel);
//   }
//
//
//   void setUserModel(UserModel model) {
//     userModel = model;
//     String jsonvalue = jsonEncode(userModel!.toJson());
//     _prefs.setString(kUserModel, jsonvalue); //model转json存储
//   }
// }
