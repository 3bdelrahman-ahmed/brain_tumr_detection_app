import 'package:hive/hive.dart';

part 'clinics_model.g.dart';

@HiveType(typeId: 0)
class Clinic extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String address;

  @HiveField(2)
  final String phoneNumber;

  @HiveField(3)
  final String licenseDoc;

  @HiveField(4)
  final bool isApproved;

  Clinic({
    required this.id,
    required this.address,
    required this.phoneNumber,
    required this.licenseDoc,
    required this.isApproved,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
      id: json['id'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      licenseDoc: json['licenseDocument'],
      isApproved: json['isApproved'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'phoneNumber': phoneNumber,
      'licenseDocument': licenseDoc,
      'isApproved': isApproved,
    };
  }
}
