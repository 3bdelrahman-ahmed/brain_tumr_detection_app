import 'package:brain_tumr_detection_app/features/doctors/data/models/patient.dart';

class Review {
  int id;
  int stars;
  String comment;
  DateTime createdAt;
  Patient patient;

  Review({
    required this.id,
    required this.stars,
    required this.comment,
    required this.createdAt,
    required this.patient,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      stars: json['stars'],
      comment: json['comment'],
      createdAt: DateTime.parse(json['createdAt']),
      patient: Patient.fromJson(json['patient']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'stars': stars,
      'comment': comment,
      'createdAt': createdAt.toIso8601String(),
      'patient': patient.toJson(),
    };
  }
}
