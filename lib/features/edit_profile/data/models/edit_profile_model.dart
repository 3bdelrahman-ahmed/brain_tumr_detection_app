import 'dart:io';

import 'package:dio/dio.dart';

class EditProfileRequestModel {
  final String? name;
  final String? userName;
  final String? email;

  final File? profileImage;

  EditProfileRequestModel({
    this.name,
    this.userName,
    this.profileImage,
    this.email,
  });

  FormData toFormData() {
    final formData = FormData();
    formData.fields.add(MapEntry('fullName', name ?? ''));
    formData.fields.add(MapEntry('userName', userName ?? ''));
    formData.fields.add(MapEntry('email', email ?? ''));

    if (profileImage != null) {
      formData.files.add(
        MapEntry(
          'profileImage',
          MultipartFile.fromFileSync(profileImage!.path,
              filename: profileImage!.path.split('/').last),
        ),
      );
    }
    return formData;
  }
}

class EditProfileResponseModel {
  final String? name;
  final String? userName;
  final String? email;
  final String? profileImageUrl;

  EditProfileResponseModel({
    this.name,
    this.userName,
    this.email,
    this.profileImageUrl,
  });

  factory EditProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return EditProfileResponseModel(
      name: json['fullName'],
      userName: json['userName'],
      email: json['email'],
      profileImageUrl: json['profileImageUrl'],
    );
  }
}
