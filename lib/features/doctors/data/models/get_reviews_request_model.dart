class GetReviewsRequestModel {
  int doctorId;
  int pageSize;
  int pageIndex;

  GetReviewsRequestModel({
    required this.doctorId,
    required this.pageSize,
    required this.pageIndex,
  });

  factory GetReviewsRequestModel.fromJson(Map<String, dynamic> json) {
    return GetReviewsRequestModel(
      doctorId: json['doctorId'],
      pageSize: json['pageSize'],
      pageIndex: json['pageIndex'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctorId': doctorId,
      'pageSize': pageSize,
      'pageIndex': pageIndex,
    };
  }
}
