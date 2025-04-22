import 'dart:io';

import 'package:dio/dio.dart';

class RegisterResponseModel {
  String? email;

  RegisterResponseModel({this.email});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }
}

class PatientRegisterRequestModel {
  final File? profileProfile;
  final String fullName;
  final String userName;
  final String email;
  final String dateOfBirth;
  final String password;
  final double latitude;
  final double longitude;
  final String gender;

  PatientRegisterRequestModel(
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
    if (profileProfile != null) {
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

class DoctorRegisterRequestModel {
  final File profileProfile;
  final String fullName;
  final String userName;
  final String email;
  final String password;
  final double latitude;
  final double longitude;
  final String phone;
  final File licenseFront;
  final File licenseBack;
  final File cliniclicense;
  final String clinicAddress;
  final String gender;
  final String dateOfBirth;

  DoctorRegisterRequestModel({
   required  this.profileProfile,
  required  this.fullName,
   required this.userName,
   required this.email,
  required  this.password,
  required  this.latitude,
   required this.longitude,
  required  this.phone,
  required  this.licenseFront,
  required  this.licenseBack,
  required  this.cliniclicense,
  required  this.clinicAddress,
  required  this.dateOfBirth,
  required  this.gender,
  });
  Future<FormData> toFormData() async {
    FormData formData = FormData.fromMap({
      "Doctor.FullName": fullName,
      "Doctor.Username": userName,
      "Doctor.Email": email,
      "Doctor.Password": password,
      "Doctor.DateOfBirth": dateOfBirth,
      "Doctor.ProfilePicture": await MultipartFile.fromFile(
        profileProfile.path,
        filename: profileProfile.path.split('/').last,
      ),
      "Doctor.LicenseDocumentFront": await MultipartFile.fromFile(
        licenseFront.path,
        filename: licenseFront.path.split('/').last,
      ),
      "Doctor.LicenseDocumentBack": await MultipartFile.fromFile(
        licenseBack.path,
        filename: licenseBack.path.split('/').last,
      ),
      "Clinic.LicenseDocument": await MultipartFile.fromFile(
        cliniclicense.path,
        filename: cliniclicense.path.split('/').last,
      ),
      "Clinic.Latitude": latitude,
      "Clinic.Longitude": longitude,
      "Clinic.PhoneNumber": phone,
      "Clinic.Address": clinicAddress,
      "Doctor.Gender": gender,
    });
    return formData;
  }
}
