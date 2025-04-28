
import 'package:brain_tumr_detection_app/core/data/models/user_model.dart';

class PatientModel extends User {
  PatientModel(
      {required super.id,
      required super.userName,
      required super.name,
      required super.email,
      required super.image,
      required super.token,
      required super.location, required super.role});

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'] as String,
      userName: json['userName'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      image: json['image'] as String,
      token: json['token'] as String,
      location: json['location'] as String, role: json['role'] as String,
    );
  }
}
