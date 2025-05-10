import 'patient.dart';

class ViewPatientResponseModel {
  int? id;
  String? date;
  String? startTime;
  String? status;
  Patient? patient;

  ViewPatientResponseModel({
    this.id,
    this.date,
    this.startTime,
    this.status,
    this.patient,
  });

  factory ViewPatientResponseModel.fromJson(Map<String, dynamic> json) {
    return ViewPatientResponseModel(
      id: json['id'] as int?,
      date: json['date'] as String?,
      startTime: json['startTime'] as String?,
      status: json['status'] as String?,
      patient: json['patient'] == null
          ? null
          : Patient.fromJson(json['patient'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date,
        'startTime': startTime,
        'status': status,
        'patient': patient?.toJson(),
      };
}
