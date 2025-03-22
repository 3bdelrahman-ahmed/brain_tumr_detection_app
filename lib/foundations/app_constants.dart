import 'dart:convert';

import '../core/data/local_services/app_caching_helper.dart';
import '../features/login/data/models/login_model.dart';

class AppConstants {
  static bool onBoarding = false;
  static String accessToken = '';
  static User? user;


    static setToken(String token) async {
    await AppCacheHelper.setSecuredString(
        key: AppCacheHelper.tokenKey, value: token);
    accessToken = token;
  }



  static setUser(User user) async {
    await AppCacheHelper.setSecuredString(
      key: AppCacheHelper.user,
      value: jsonEncode(user.toJson()), // Serialize to JSON
    );
    AppConstants.user = user;
  }

  // static getUser() async {
  //   String? cacheUser = await AppCacheHelper.getSecuredString(
  //     key: AppCacheHelper.user,
  //   );
  //   print('cacheUser: ${cacheUser?.isEmpty}ffffffffffff');
  //   if (cacheUser != null && cacheUser.isNotEmpty) {
  //     print('ddddddddddddddddddd');
  //     try {
  //       AppConst.user = User.fromMap(jsonDecode(cacheUser));
  //     } catch (e) {
  //       print('error: $e');
  //     }
  //   }
  // }

  // static setBiometricUser(User user) async {
  //   print("set use biometric data");
  //   await AppCacheHelper.setSecuredString(
  //     key: AppCacheHelper.biometricUser,
  //     value: jsonEncode(user.toMap()), // Serialize to JSON
  //   );
  //   AppConst.user = user;
  // }

  // static getBiometricUser() async {
  //   String? cacheUser = await AppCacheHelper.getSecuredString(
  //     key: AppCacheHelper.biometricUser,
  //   );
  //   print('cacheUser: ${cacheUser?.isEmpty}ffffffffffff');
  //   if (cacheUser != null && cacheUser.isNotEmpty) {
  //     return User.fromMap(jsonDecode(cacheUser));
  //   }
  // }

  static Future getToken() async {
    return await AppCacheHelper.getSecuredString(
      key: AppCacheHelper.tokenKey,
    );
  }

  static getBiometricToken() async {
    return await AppCacheHelper.getSecuredString(
      key: AppCacheHelper.biometricTokenKey,
    );
  }

  static setBiometricToken(String token) async {
    await AppCacheHelper.setSecuredString(
        key: AppCacheHelper.biometricTokenKey, value: token);
    // accessToken = token;
  }
}