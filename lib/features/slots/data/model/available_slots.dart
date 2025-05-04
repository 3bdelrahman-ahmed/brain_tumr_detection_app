import 'package:brain_tumr_detection_app/core/helper/functions/convert_time_slot_function.dart';

class AvailableSlotsModel {
  int? id;
  int? dayOfWeek;
  String? startTime;
  bool? isAvailable;

  AvailableSlotsModel(
      {this.id, this.dayOfWeek, this.startTime, this.isAvailable});

  AvailableSlotsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dayOfWeek = json['dayOfWeek'];
    startTime = formatTimeTo24Hour(json['startTime']);
    isAvailable = json['isAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dayOfWeek'] = this.dayOfWeek;
    data['startTime'] = this.startTime;
    data['isAvailable'] = this.isAvailable;
    return data;
  }
}

class AvailableSlotsRequestModel {
  final int clinicId;
  final int day;

  AvailableSlotsRequestModel({required this.clinicId, required this.day});
}
