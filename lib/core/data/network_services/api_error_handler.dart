import 'package:dio/dio.dart';

class ApiErrorModel {
  final String? message;
  final int? code;

  final dynamic errors;

  ApiErrorModel({
    this.message,
    this.code,
    this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      message: json['message'],
      code: json['statusCode'],
      errors: json['error'],
    );
  }

  /// Returns a String containing all the error messages
  String getAllErrorMessages() {
    if (errors == null) {
      return message ?? "Unknown Error occurred";
    }

    // Check if errors is a non-empty List
    if (errors is List && (errors as List).isNotEmpty) {
      return (errors as List).join('\n');
    }

    return message ?? "Unknown Error occurred";
  }
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(
            message: "Connection to server failed",
          );
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "Request to the server was cancelled");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "Connection timeout with the server");
        case DioExceptionType.unknown:
          return ApiErrorModel(
              message:
                  "Connection to the server failed due to internet connection");
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
              message: "Receive timeout in connection with the server");
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
              message: "Send timeout in connection with the server");
        default:
          return ApiErrorModel(message: "Something went wrong");
      }
    } else {
      return ApiErrorModel(message: "Unknown error occurred");
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  return ApiErrorModel(
    message: data['message'] ?? "Unknown error occurred",
    code: data['statusCode'],
    errors: data['error'],
  );
}
