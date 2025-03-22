import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image/image.dart' as img;
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'dio_service.dart';

class AppDio {
  AppDio._privateConstructor(); // Private constructor
  static final AppDio _instance =
      AppDio._privateConstructor(); // Singleton instance
  factory AppDio() => _instance; // Factory to return the same instance

  final ValueNotifier<int> _progressNotifier = ValueNotifier<int>(0);

  ValueNotifier<int> get progressNotifier => _progressNotifier;

  // download File
  Future<void> downloadFile(String url, String filename) async {
    final dio = Dio();

    // Step 1: Request storage permissions (Android only)
    if (Platform.isAndroid) {
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }
    }

    // Step 2: Define the directory paths
    Directory? directory;
    if (Platform.isAndroid) {
      directory = Directory('/storage/emulated/0/Download');
    } else if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    }

    // Ensure the directory exists
    if (!await directory!.exists()) {
      await directory.create(recursive: true);
    }

    // Step 3: Sanitize the filename
    String sanitizedFileName =
        filename.replaceAll(RegExp(r'[<>:"/\\|?*]'), '_');
    String filePath = '${directory.path}/$sanitizedFileName';

    // Step 4: Attempt the download
    try {
      await dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            int progress = ((received / total) * 100).toInt();
            _progressNotifier.value = progress;
            print('Download progress: ${_progressNotifier.value}');
            // Emit progress
          }
        },
      );
      print('Download completed: $filePath');
      // _progressNotifier.value = 100; // Finalize progress
      // final result = await OpenFile.open(filePath); // Open the downloaded file
      // if (result.type != ResultType.done) {
      //   print('Failed to open file: ${result.message}');
      // }
    } catch (e) {
      print('Download failed: $e');
      _progressNotifier.value = -1; // Error progress
    }
  }

  Future<Response> post({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await DioService.instance.sendRequest(
        method: 'POST',
        path: path,
        data: data,
        queryParams: queryParams,
        headers: await DioService.instance.getHeaders(),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }


// Read (GET)
  Future<Response> get({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await DioService.instance.sendRequest(
        method: 'GET',
        data: data,
        path: path,
        queryParams: queryParams,
        headers: await DioService.instance.getHeaders(),
      );
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  // for notification history made by laravel BE

  Future<Response> sendRequestWithCustomBaseUrl({
    required String method,
    required String fullUrl, // Custom full URL to override base URL
    dynamic data,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      print("URL ${fullUrl}");
      final response = await Dio().request(
        fullUrl, // Use fullUrl directly instead of relying on baseUrl
        data: data,
        queryParameters: queryParams,
        options: Options(
          sendTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
          method: method,
          headers: headers ?? await DioService.instance.getHeaders(),
        ),
      );
      return response;
    } on DioException catch (e) {
      print("Request failed: ${e.response?.data}");
      rethrow;
    }
  }

  // Update (PUT)
  Future<Response> put({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await DioService.instance.sendRequest(
        method: 'PUT',
        path: path,
        data: data,
        queryParams: query,
        headers: await DioService.instance.getHeaders(),
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  // Delete (DELETE)
  Future<Response> delete({
    required String path,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await DioService.instance.sendRequest(
        method: 'DELETE',
        path: path,
        data: data,
        headers: await DioService.instance.getHeaders(),
      );
      return response;
    } on DioException catch (e) {
      print(e.response?.data);
      rethrow;
    }
  }

  // Patch (PATCH)
  Future<Response> patch({
    required String path,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await DioService.instance.sendRequest(
        method: 'PATCH',
        path: path,
        data: data,
        headers: await DioService.instance.getHeaders(),
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  // Upload (POST)
  Future<Response> uploadImages({
    required List<File> images, // List of image files
  }) async {
    try {
      // Create FormData instance
      FormData formData = FormData();
      print("what happened");
      // Iterate over each image, convert it to MultipartFile and add it to formData
      for (File image in images) {
        File compressedImage = await compressImageInIsolate(image);
        Uint8List uint8list =
            await compressedImage.readAsBytes(); // Get image bytes
        String fileName =
            compressedImage.path.split("/").last; // Get the file name

        // Get MIME type of the file (e.g., image/jpeg, image/png)
        String? mimeType = lookupMimeType(compressedImage.path);
        String mimeTypePrimary = mimeType?.split('/')[0] ?? 'application';
        String mimeTypeSecondary = mimeType?.split('/')[1] ?? 'octet-stream';

        // Add each image as a multipart file to the formData
        formData.files.add(
          MapEntry(
            'images', // Field name in the form, keep consistent with the server
            MultipartFile.fromBytes(
              uint8list,
              filename: fileName,
              contentType: MediaType(
                  mimeTypePrimary, mimeTypeSecondary), // Set correct MIME type
            ),
          ),
        );
      }
      print("request sendd ");

      // Send the request using DioService

      final response = await DioService.instance.sendRequest(
        method: 'POST',
        path: 'https://app.talentindustrial.com/plumber/upload', // Upload URL

        data: formData, // Send files as FormData
        headers: await DioService.instance.getHeaders(),
      );
      print("request sent");
      return response;
    } catch (e) {
      print("caught exception $e");
      rethrow;
    }
  }

  Future<File> compressImageInIsolate(File file) async {
    final ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(_compressImage, [receivePort.sendPort, file.path]);

    final result = await receivePort.first as String;

    return File(result);
  }

// Isolate function
  void _compressImage(List<dynamic> args) {
    SendPort sendPort = args[0];
    String filePath = args[1];

    // Perform compression
    File file = File(filePath);
    img.Image? image = img.decodeImage(file.readAsBytesSync());
    img.Image resizedImage = img.copyResize(image!, width: 1024);
    File compressedFile = File('${filePath}_compressed.jpg')
      ..writeAsBytesSync(img.encodeJpg(resizedImage, quality: 85));

    // Send the path of the compressed file back to the main isolate
    sendPort.send(compressedFile.path);
  }
}
