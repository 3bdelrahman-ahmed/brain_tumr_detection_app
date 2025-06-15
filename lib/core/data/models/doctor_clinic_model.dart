import '../local_services/cached_models/clinics_model.dart';

class DoctorClinicModel {
  int id;
  String address;
  String? phoneNumber;
  String? doctorProfilePicture;
  double averageStarRating;
  String? doctorFullName;
  String? fullName;
  List<Clinic>? clinics;
  String? userName;
  DateTime? dateOfBirth;
  String? gender;
  int? age;

  DoctorClinicModel({
    required this.id,
    required this.address,
    required this.phoneNumber,
    this.doctorProfilePicture,
    required this.averageStarRating,
    required this.doctorFullName,
    this.fullName,
    this.clinics,
    this.userName,
    this.dateOfBirth,
    this.gender,
    this.age,
  });

  factory DoctorClinicModel.fromJson(Map<String, dynamic> json) {
    final clinicsList = json['clinics'] != null
        ? List<Clinic>.from(json['clinics'].map((c) => Clinic.fromJson(c)))
        : null;

    return DoctorClinicModel(
      id: json['id'],
      address: clinicsList?.first.address ?? json['address'],
      phoneNumber: json['doctorPhoneNumber'] ?? json['phoneNumber'],
      doctorProfilePicture: json['doctorProfilePicture'] ?? json['profilePicture'],
      averageStarRating: (json['averageStarRating'] as num).toDouble(),
      doctorFullName: json['doctorFullName'] ?? json['fullName'],
      clinics: clinicsList,
      userName: json['userName'] ?? '',
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.tryParse(json['dateOfBirth'])
          : null,
      gender: json['gender'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'phoneNumber': phoneNumber,
      'profilePicture': doctorProfilePicture,
      'averageStarRating': averageStarRating,
      'doctorFullName': doctorFullName,
      'fullName': fullName,
      'clinics': clinics?.map((c) => c.toJson()).toList(),
      'userName': userName,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'gender': gender,
      'age': age,
    };
  }
}
