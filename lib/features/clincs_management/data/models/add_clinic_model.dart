import 'dart:io';

import 'package:dio/dio.dart';

class AddClinicRequestModel {
  final String phoneNumber;
  final String street;
  final double latitude;
  final double longitude;
  final File  license;

  AddClinicRequestModel({
    required this.phoneNumber,
    required this.street,
    required this.latitude,
    required this.longitude,
    required this.license,
  });

 FormData toFormData() {
    return FormData.fromMap({
      'phoneNumber': phoneNumber,
      'Address': street,
      'latitude': latitude,
      'longitude': longitude,
      'LicenseDocument': MultipartFile.fromFileSync(
        license.path,
        filename: license.path.split('/').last,
      ),
    });
  }

  
}


class AddClinicResponseModel {
  final String message;

  AddClinicResponseModel({required this.message});

  factory AddClinicResponseModel.fromJson(Map<String, dynamic> json) {
    return AddClinicResponseModel(
      message: json['message'] ?? '',
    );
  }
}