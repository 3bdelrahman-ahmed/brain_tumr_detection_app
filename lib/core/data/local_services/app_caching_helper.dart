  import 'package:flutter/material.dart';
  import 'package:flutter_secure_storage/flutter_secure_storage.dart';

  class AppCacheHelper {
    AppCacheHelper._();

    ///key for caching
    static const String tokenKey = "token";
    static const String biometricTokenKey = "biometricToken";
    static const String onBoardingKey = "onBoarding";
    static const String user = "cacheUser";
    static const String biometricUser = "biometricUser";
    static const String onesignalId = "onesignalId";
    static const String biometricEnabled = "biometricEnabled";
    static const String rememberMe = "rememberMe";
    static const String userRole = "userRole";

    /// Saves a [value] with a [key] in the FlutterSecureStorage.
    static setSecuredString({required String key, required dynamic value}) async {
      const flutterSecureStorage = FlutterSecureStorage();
      debugPrint(
          "FlutterSecureStorage : setSecuredString with key : $key and value : $value");
      await flutterSecureStorage.write(key: key, value: value);
    }

    
    /// Gets an String value from FlutterSecureStorage with given [key].
    static getSecuredString({required String key}) async {
      const flutterSecureStorage = FlutterSecureStorage();
      debugPrint('FlutterSecureStorage : getSecuredString with key :');
      return await flutterSecureStorage.read(key: key) ?? '';
    }

    /// Removes value by key in the FlutterSecureStorage
    static clearSecuredData(String key) async {
      debugPrint('FlutterSecureStorage : all data has been cleared');
      const flutterSecureStorage = FlutterSecureStorage();
      await flutterSecureStorage.delete(key: key);
    }

    /// Removes all keys and values in the FlutterSecureStorage
    static clearAllSecuredData() async {
      debugPrint('FlutterSecureStorage : all data has been cleared');
      const flutterSecureStorage = FlutterSecureStorage();
      await flutterSecureStorage.deleteAll();
    }
  }