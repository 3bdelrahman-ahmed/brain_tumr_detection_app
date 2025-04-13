import 'dart:io';

import 'package:dio/dio.dart';
class RegisterResponseModel{
  String? email;

  RegisterResponseModel({this.email});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }
}

class RegisterRequestModel{
  final File? profileProfile;
  final String fullName;
  final String userName;
  final String email;
  final String dateOfBirth;
  final String password;
  final double latitude;
  final double longitude;
  final String gender;

  RegisterRequestModel(
      this.profileProfile,
      this.fullName,
      this.userName,
      this.email,
      this.dateOfBirth,
      this.password,
      this.latitude,
      this.longitude,
      this.gender,
      );
  Future<FormData> toFormData() async {
    FormData formData = FormData.fromMap({
      "fullName": fullName,
      "userName": userName,
      "email": email,
      "dateOfBirth": dateOfBirth,
      "password": password,
      "latitude": latitude,
      "longitude": longitude,
      "gender": gender,
    });
    if (profileProfile != null){
      formData.files.add(
        MapEntry(
          "profilePicture",
          await MultipartFile.fromFile(
            profileProfile!.path,
            filename: profileProfile!.path.split('/').last,
          ),
        ),
      );
    }
    return formData;
  }
}
