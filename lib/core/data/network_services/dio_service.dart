import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:brain_tumr_detection_app/foundations/app_urls.dart';
import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';



class DioService {
  static DioService? _instance;
  late Dio _dio;

  DioService._() {
    _dio = Dio();
    BaseOptions baseOptions = BaseOptions(
      baseUrl: AppUrls.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 90),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept-Language': 'en'
      },
    );

    _dio.options = baseOptions;

    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: false,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  static DioService get instance {
    _instance ??= DioService._();
    return _instance!;
  }

  static Dio get dio => instance._dio;

  Future<Map<String, String>> getHeaders({bool withToken = true}) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      // 'app-version': await getAppVersion()
    };
    if (withToken && AppConstants.getToken().toString().isNotEmpty) {
      headers['Authorization'] = 'Bearer ${await AppConstants.getToken()}';
    }
    return headers;
  }

  Future<Response> sendRequest({
    required String method,
    required String path,
    dynamic data,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    String? customBaseUrl, // Add this parameter for custom base URL
  }) async {
    try {
      final String url = customBaseUrl != null ? '$customBaseUrl$path' : path;

      final response = await _dio.request(
        url, // Use full URL if customBaseUrl is provided
        data: data,
        queryParameters: queryParams,
        options: Options(
          sendTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
          method: method,
          headers: headers ?? _dio.options.headers,
        ),
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String version =
        packageInfo.version; // The version of the app (e.g., "1.0.0")
    String buildNumber =
        packageInfo.buildNumber; // The build number of the app (e.g., "1")
    print('***********$version+$buildNumber');
    return '$version+$buildNumber';
  }
}
