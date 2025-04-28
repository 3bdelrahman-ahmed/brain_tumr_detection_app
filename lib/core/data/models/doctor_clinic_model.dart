class DoctorClinicModel {
  int id;
  String address;
  String phoneNumber;
  String? doctorProfilePicture;
  double averageStarRating;
  String doctorFullName;

  DoctorClinicModel({
    required this.id,
    required this.address,
    required this.phoneNumber,
    this.doctorProfilePicture,
    required this.averageStarRating,
    required this.doctorFullName,
  });

  factory DoctorClinicModel.fromJson(Map<String, dynamic> json) {
    return DoctorClinicModel(
      id: json['id'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      doctorProfilePicture: json['doctorProfilePicture'],
      averageStarRating: json['averageStarRating'],
      doctorFullName: json['doctorFullName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'phoneNumber': phoneNumber,
      'doctorProfilePicture': doctorProfilePicture,
      'averageStarRating': averageStarRating,
      'doctorFullName': doctorFullName,
    };
  }
}
