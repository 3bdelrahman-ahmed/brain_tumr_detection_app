class Patient {
  String id;
  String fullName;
  String? profilePicture;
  DateTime dateOfBirth;
  String userName;
  String gender;
  int age;

  Patient({
    required this.id,
    required this.fullName,
    this.profilePicture,
    required this.dateOfBirth,
    required this.userName,
    required this.gender,
    required this.age,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      fullName: json['fullName'],
      profilePicture: json['profilePicture'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      userName: json['userName'],
      gender: json['gender'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'profilePicture': profilePicture,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'userName': userName,
      'gender': gender,
      'age': age,
    };
  }
}
