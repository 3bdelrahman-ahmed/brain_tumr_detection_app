import 'dart:io';

import 'package:dio/dio.dart';

class UploadScanRequestModel {
  final double long;
  final double lat;
  final File image;

  UploadScanRequestModel({
    required this.long,
    required this.lat,
    required this.image,
  });

  Future<FormData> toFormData() async {
    FormData formData = FormData.fromMap({
      "Longitude": long,
      "Latitude": lat,
    });
    formData.files.add(
      MapEntry(
        "Image",
        await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
      ),
    );
    return formData;
  }
}

class UploadScanResponseModel {
  String? cancerClass;
  String? imageUrl;
  String? confidence;

  UploadScanResponseModel({this.cancerClass, this.imageUrl, this.confidence});

  UploadScanResponseModel.fromJson(Map<String, dynamic> json) {
    confidence = json['confidence'];
    imageUrl = json['image'];
    cancerClass = json['class'];
  }
}
