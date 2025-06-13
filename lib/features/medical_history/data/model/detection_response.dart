class DetectionResponse {
  final int pageIndex;
  final int pageSize;
  final int count;
  final int totalPages;
  final List<DetectionItem> data;

  DetectionResponse({
    required this.pageIndex,
    required this.pageSize,
    required this.count,
    required this.totalPages,
    required this.data,
  });

  factory DetectionResponse.fromJson(Map<String, dynamic> json) {
    return DetectionResponse(
      pageIndex: json['pageIndex'],
      pageSize: json['pageSize'],
      count: json['count'],
      totalPages: json['totalPages'],
      data: List<DetectionItem>.from(
        json['data'].map((item) => DetectionItem.fromJson(item)),
      ),
    );
  }
}

class DetectionItem {
  final String imagePath;
  final String detectionClass;
  final bool isReviewed;
  final DateTime uploadDate;
  final DoctorReview? doctorReview;

  DetectionItem({
    required this.imagePath,
    required this.detectionClass,
    required this.isReviewed,
    required this.uploadDate,
    this.doctorReview,
  });

  factory DetectionItem.fromJson(Map<String, dynamic> json) {
    return DetectionItem(
      imagePath: json['imagePath'],
      detectionClass: json['detectionClass'],
      isReviewed: json['isReviewed'],
      uploadDate: DateTime.parse(json['uploadDate']),
      doctorReview: json['doctorReview'] != null
          ? DoctorReview.fromJson(json['doctorReview'])
          : null,
    );
  }
}

class DoctorReview {
  final String findings;
  final String reasoning;

  DoctorReview({required this.findings, required this.reasoning});

  factory DoctorReview.fromJson(Map<String, dynamic> json) {
    return DoctorReview(
      findings: json['findings'],
      reasoning: json['reasoning'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'findings': findings,
      'reasoning': reasoning,
    };
  }
}

class DetectionRequest {
  final int pageIndex;
  final int pageSize;

  DetectionRequest({required this.pageIndex, required this.pageSize});

  Map<String, dynamic> toJson() {
    return {
      'pageIndex': pageIndex,
      'pageSize': pageSize,
    };
  }
}
