import 'dart:convert';
import '../core/data/local_services/app_caching_helper.dart';
import '../features/login/data/models/login_model.dart';

class AppConstants {
  AppConstants._();

  static AppConstants? _instance;
  static AppConstants get instance {
    _instance ??= AppConstants._();
    return _instance!;
  }

  static bool onBoarding = false;
  static String accessToken = '';
  static User? user;
  static String? location;
  static cacheString({required String key, required dynamic value}) async {
    await AppCacheHelper.setSecuredString(key: key, value: value);
  }

  static setToken(String token) async {
    await AppCacheHelper.setSecuredString(
        key: AppCacheHelper.tokenKey, value: token);
    accessToken = token;
  }

  static setOnBoardingBoolean(bool value) async {
    print("setting boolean value ${value.toString()}");
    await AppCacheHelper.setSecuredString(
        key: AppCacheHelper.onBoardingKey, value: value.toString());
    onBoarding = value;
  }

  static Future<bool> getOnBoardingBoolean() async {
    String? onBoardingValue = await AppCacheHelper.getSecuredString(
      key: AppCacheHelper.onBoardingKey,
    );
    if (onBoardingValue != null && onBoardingValue.isNotEmpty) {
      onBoarding = onBoardingValue == 'true';
    }
    print("getting boolean value ${onBoarding.toString()}");

    return onBoarding;
  }

  static setUser(User user) async {
    await AppCacheHelper.setSecuredString(
      key: AppCacheHelper.user,
      value: jsonEncode(user.toJson()), // Serialize to JSON
    );
    AppConstants.user = user;
  }

  static getUser() async {
    String? cacheUser = await AppCacheHelper.getSecuredString(
      key: AppCacheHelper.user,
    );
    print('cacheUser: ${cacheUser?.isEmpty}ffffffffffff');
    if (cacheUser != null && cacheUser.isNotEmpty) {
      print('ddddddddddddddddddd');
      try {
        AppConstants.user = User.fromJson(jsonDecode(cacheUser));
      } catch (e) {
        print('error: $e');
      }
    }
  }

  static setBiometricUser(User user) async {
    print("set use biometric data");
    await AppCacheHelper.setSecuredString(
      key: AppCacheHelper.biometricUser,
      value: jsonEncode(user.toJson()), // Serialize to JSON
    );
    AppConstants.user = user;
  }

  static getBiometricUser() async {
    String? cacheUser = await AppCacheHelper.getSecuredString(
      key: AppCacheHelper.biometricUser,
    );
    print('cacheUser: ${cacheUser?.isEmpty}ffffffffffff');
    if (cacheUser != null && cacheUser.isNotEmpty) {
      return User.fromJson(jsonDecode(cacheUser));
    }
  }

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
    await AppCacheHelper.setSecuredString(key: AppCacheHelper.biometricTokenKey, value: token);
    accessToken = token;
  }
  static clearLogin() async{
    accessToken = '';
    user = null;
    location = null;
    await AppCacheHelper.clearAllSecuredData();
  }
}
