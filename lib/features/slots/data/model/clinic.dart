class Clinic {
  final int id;
  final String address;
  final String phoneNumber;
  final String licenseDoc;
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
