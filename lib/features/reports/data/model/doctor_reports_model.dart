class DoctorReportsResponseModel {
  int? pageIndex;
  int? pageSize;
  int? count;
  int? totalPages;
  List<Report>? reports;

  DoctorReportsResponseModel(
      {this.pageIndex,
      this.pageSize,
      this.count,
      this.totalPages,
      this.reports});

  DoctorReportsResponseModel.fromJson(Map<String, dynamic> json) {
    pageIndex = json['pageIndex'];
    pageSize = json['pageSize'];
    count = json['count'];
    totalPages = json['totalPages'];
    if (json['data'] != null) {
      reports = <Report>[];
      json['data'].forEach((v) {
        reports!.add(new Report.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageIndex'] = this.pageIndex;
    data['pageSize'] = this.pageSize;
    data['count'] = this.count;
    data['totalPages'] = this.totalPages;
    if (this.reports != null) {
      data['data'] = this.reports!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Report {
  int? id;
  String? imagePath;
  String? detectionClass;
  String? confidence;
  String? aiGeneratedImagePath;
  String? uploadDate;
  int? patientId;
  String? patientName;
  String? patientProfilePicture;
  String? patientDateOfBirth;
  String? patientGender;
  int? age;
  bool? isViewed;

  Report(
      {this.id,
      this.imagePath,
      this.detectionClass,
      this.confidence,
      this.aiGeneratedImagePath,
      this.uploadDate,
      this.patientId,
      this.patientName,
      this.patientProfilePicture,
      this.patientDateOfBirth,
      this.patientGender,
      this.isViewed,
      this.age});

  Report.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagePath = json['imagePath'];
    detectionClass = json['detectionClass'];
    confidence = json['confidence'];
    aiGeneratedImagePath = json['aiGeneratedImagePath'];
    uploadDate = json['uploadDate'];
    patientId = json['patientId'];
    patientName = json['patientName'];
    patientProfilePicture = json['patientProfilePicture'];
    patientDateOfBirth = json['patientDateOfBirth'];
    patientGender = json['patientGender'];
    age = json['age'];
    isViewed = json['isViewed'] ?? false; // Default to false if not present
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imagePath'] = this.imagePath;
    data['detectionClass'] = this.detectionClass;
    data['confidence'] = this.confidence;
    data['aiGeneratedImagePath'] = this.aiGeneratedImagePath;
    data['uploadDate'] = this.uploadDate;
    data['patientId'] = this.patientId;
    data['patientName'] = this.patientName;
    data['patientProfilePicture'] = this.patientProfilePicture;
    data['patientDateOfBirth'] = this.patientDateOfBirth;
    data['patientGender'] = this.patientGender;
    data['age'] = this.age;
    return data;
  }
}


class DoctorReportsRequestModel {
  final int pageIndex;
  final int pageSize;


  DoctorReportsRequestModel({
    required this.pageIndex,
    required this.pageSize,

  });

  Map<String, dynamic> toJson() {
    return {
      'pageIndex': pageIndex,
      'pageSize': pageSize,

    };
  }
}
