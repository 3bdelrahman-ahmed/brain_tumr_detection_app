class AddSlotRequestModel {
  final int clinicId;
  final int day;
  final String startTime;

  AddSlotRequestModel({
    required this.clinicId,
    required this.day,
    required this.startTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'clinicId': clinicId,
      'dayOfWeek': day,
      'startTime': startTime,
    };
  }
}

class AddSlotResponseModel {
  final int id;
  final int dayOfWeek;
  final String startTime;
  final bool isAvailable;

  AddSlotResponseModel({
    required this.id,
    required this.dayOfWeek,
    required this.startTime,
    required this.isAvailable,
  });

  factory AddSlotResponseModel.fromJson(Map<String, dynamic> json) {
    return AddSlotResponseModel(
      id: json['id'],
      dayOfWeek: json['dayOfWeek'],
      startTime: json['startTime'],
      isAvailable: json['isAvailable'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dayOfWeek': dayOfWeek,
      'startTime': startTime,
      'isAvailable': isAvailable,
    };
  }
}
