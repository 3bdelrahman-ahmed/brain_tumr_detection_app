import 'dart:convert';
import 'package:brain_tumr_detection_app/core/utils/extenstions/navigation_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../core/data/local_services/app_caching_helper.dart';
import '../features/login/data/models/login_model.dart';
import '../generated/l10n.dart';

class AppConstants {
  AppConstants._();

  static AppConstants? _instance;

  static AppConstants get instance {
    _instance ??= AppConstants._();
    return _instance!;
  }

  static BuildContext context =
      NavigationExtensions.navigatorKey.currentContext!;

  static bool onBoarding = false;
  static String accessToken = '';
  static User? user;
  static String? location;
  static bool langCode = true;
  static LatLng? currentLocation;

  static cacheString({required String key, required dynamic value}) async {
    await AppCacheHelper.setSecuredString(key: key, value: value);
  }

  static setToken(String token) async {
    await AppCacheHelper.setSecuredString(
        key: AppCacheHelper.tokenKey, value: token);
    accessToken = token;
  }

  static setLanguage(bool language) async {
    await AppCacheHelper.setSecuredString(
        key: AppCacheHelper.language, value: language.toString());
    langCode = language;
  }

  static Future<bool> getLanguage() async {
    // Try to get cached language
    String? cachedLang =
        await AppCacheHelper.getSecuredString(key: AppCacheHelper.language);
    print("Get Language From Cache: $cachedLang");
    if (cachedLang == null || cachedLang.isEmpty) {
      // If not found, get system language
      final systemLocale = WidgetsBinding.instance.platformDispatcher.locale;
      final isEnglish = systemLocale.languageCode == 'en';
      print("System Language Detected: ${systemLocale.languageCode}");
      await setLanguage(isEnglish);
      langCode = isEnglish;
    } else {
      langCode = cachedLang == 'true';
    }
    return langCode;
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

  static Future<String?> getToken() async {
    final token = await AppCacheHelper.getSecuredString(
      key: AppCacheHelper.tokenKey,
    );
    accessToken = token ?? ''; // Update the static accessToken
    return token;
  }

  static getBiometricToken() async {
    return await AppCacheHelper.getSecuredString(
      key: AppCacheHelper.biometricTokenKey,
    );
  }

  static setBiometricToken(String token) async {
    await AppCacheHelper.setSecuredString(
        key: AppCacheHelper.biometricTokenKey, value: token);
    accessToken = token;
  }

  static clearLogin() async {
    accessToken = '';
    user = null;
    location = null;
    await AppCacheHelper.clearSecuredData(AppCacheHelper.user);
  }

  static List<Map<int, String>> days = [
    {
      0: S.of(AppConstants.context).sunday,
    },
    {
      1: S.of(AppConstants.context).monday,
    },
    {
      2: S.of(AppConstants.context).tuesday,
    },
    {
      3: S.of(AppConstants.context).wednesday,
    },
    {
      4: S.of(AppConstants.context).thursday,
    },
    {
      5: S.of(AppConstants.context).friday,
    },
    {
      6: S.of(AppConstants.context).saturday,
    }
  ];
}
