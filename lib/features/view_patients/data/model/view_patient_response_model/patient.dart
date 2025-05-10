class Patient {
  int? id;
  String? fullName;
  String? profilePicture;
  DateTime? dateOfBirth;
  String? userName;
  String? gender;
  int? age;

  Patient({
    this.id,
    this.fullName,
    this.profilePicture,
    this.dateOfBirth,
    this.userName,
    this.gender,
    this.age,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json['id'] as int?,
        fullName: json['fullName'] as String?,
        profilePicture: json['profilePicture'] as String?,
        dateOfBirth: json['dateOfBirth'] == null
            ? null
            : DateTime.parse(json['dateOfBirth'] as String),
        userName: json['userName'] as String?,
        gender: json['gender'] as String?,
        age: json['age'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'profilePicture': profilePicture,
        'dateOfBirth': dateOfBirth?.toIso8601String(),
        'userName': userName,
        'gender': gender,
        'age': age,
      };
}
