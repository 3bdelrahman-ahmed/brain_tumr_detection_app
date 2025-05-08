class AvailablePatientSlotsRequestModel {
  final int slotId;
  final String date;

  AvailablePatientSlotsRequestModel({
    required this.slotId,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'slotId': slotId,
      'date': date,
    };
  }
}


class AvailablePatientSlotsResponseModel {
  final int id;
  final String date;
  final String startTime;
  final String status;

  AvailablePatientSlotsResponseModel({
    required this.id,
    required this.date,
    required this.startTime,
    required this.status,
  });

  factory AvailablePatientSlotsResponseModel.fromJson(Map<String, dynamic> json) {
    return AvailablePatientSlotsResponseModel(
      id: json['id'],
      date: json['date'],
      startTime: json['startTime'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'startTime': startTime,
      'status': status,
    };
  }
}
