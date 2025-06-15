import 'doctor_clinic_model.dart';

class GetDoctorResponseModel {
  int pageSize;
  int pageIndex;
  int count;
  int totalPages;
  List<DoctorClinicModel> data;

  GetDoctorResponseModel({
    required this.pageSize,
    required this.pageIndex,
    required this.count,
    required this.totalPages,
    required this.data,
  });

  factory GetDoctorResponseModel.fromJson(Map<String, dynamic> json) {
    return GetDoctorResponseModel(
      pageSize: json['pageSize'],
      pageIndex: json['pageIndex'],
      count: json['count'],
      totalPages: json['totalPages'],
      data: List<DoctorClinicModel>.from(
        (json['data'] as List).map((e) => DoctorClinicModel.fromJson(e)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pageSize': pageSize,
      'pageIndex': pageIndex,
      'count': count,
      'totalPages': totalPages,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}
