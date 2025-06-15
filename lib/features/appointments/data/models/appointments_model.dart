class AppointmentsResponseModel {
  int? pageIndex;
  int? pageSize;
  int? count;
  int? totalPages;
  List<Appointments>? appointments;

  AppointmentsResponseModel(
      {this.pageIndex,
      this.pageSize,
      this.count,
      this.totalPages,
      this.appointments});

  AppointmentsResponseModel.fromJson(Map<String, dynamic> json) {
    pageIndex = json['pageIndex'];
    pageSize = json['pageSize'];
    count = json['count'];
    totalPages = json['totalPages'];
    if (json['data'] != null) {
      appointments = <Appointments>[];
      json['data'].forEach((v) {
        appointments!.add(new Appointments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageIndex'] = this.pageIndex;
    data['pageSize'] = this.pageSize;
    data['count'] = this.count;
    data['totalPages'] = this.totalPages;
    if (this.appointments != null) {
      data['data'] = this.appointments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Appointments {
  int? id;
  String? date;
  int? doctorId;
  String? startTime;
  String? status;
  String? doctorName;
  String? doctorProfilePicture;
  String? address;

  Appointments(
      {this.date,
      this.startTime,
      this.status,
      this.doctorId,
      this.doctorName,
      this.doctorProfilePicture,
      this.id,
      this.address});

  Appointments.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    id = json['id'];
    startTime = json['startTime'];
    status = json['status'];
    doctorId = json['doctorId'];
    doctorName = json['doctorName'];
    doctorProfilePicture = json['doctorProfilePicture'];
    address = json['address'];
    print("doctorID : $doctorId");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['startTime'] = this.startTime;
    data['status'] = this.status;
    data['doctorName'] = this.doctorName;
    data['doctorId'] = this.doctorId;
    data['doctorProfilePicture'] = this.doctorProfilePicture;
    data['address'] = this.address;
    return data;
  }
}

class AppointmentsRequestModel {
  final int pageIndex;
  final int pageSize;

  AppointmentsRequestModel({required this.pageIndex, required this.pageSize});
  Map<String, dynamic> toJson() {
    return {
      'pageIndex': pageIndex,
      'pageSize': pageSize,
    };
  }
}
