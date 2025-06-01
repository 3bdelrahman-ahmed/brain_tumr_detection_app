class AppointmentModelRequest {
  final int pageIndex;
  final int pageSize;

  AppointmentModelRequest({required this.pageIndex, required this.pageSize});

  Map<String, dynamic> toJson() {
    return {
      'pageIndex': pageIndex,
      'pageSize': pageSize,
    };
  }
}

class AppointmentModelResponse {
  final int pageIndex;
  final int pageSize;
  final int count;
  final int totalPages;
  final List<AppointmentData> data;

  AppointmentModelResponse({
    required this.pageIndex,
    required this.pageSize,
    required this.count,
    required this.totalPages,
    required this.data,
  });

  factory AppointmentModelResponse.fromJson(Map<String, dynamic> json) {
    return AppointmentModelResponse(
      pageIndex: json['pageIndex'],
      pageSize: json['pageSize'],
      count: json['count'],
      totalPages: json['totalPages'],
      data: List<AppointmentData>.from(
        json['data'].map((x) => AppointmentData.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pageIndex': pageIndex,
      'pageSize': pageSize,
      'count': count,
      'totalPages': totalPages,
      'data': data.map((x) => x.toJson()).toList(),
    };
  }
}

class AppointmentData {
  final String date;
  final String startTime;
  final String status;
  final String doctorName;
  final String doctorProfilePicture;
  final String address;

  AppointmentData({
    required this.date,
    required this.startTime,
    required this.status,
    required this.doctorName,
    required this.doctorProfilePicture,
    required this.address,
  });

  factory AppointmentData.fromJson(Map<String, dynamic> json) {
    return AppointmentData(
      date: json['date'],
      startTime: json['startTime'],
      status: json['status'],
      doctorName: json['doctorName'],
      doctorProfilePicture: json['doctorProfilePicture'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'startTime': startTime,
      'status': status,
      'doctorName': doctorName,
      'doctorProfilePicture': doctorProfilePicture,
      'address': address,
    };
  }
}
