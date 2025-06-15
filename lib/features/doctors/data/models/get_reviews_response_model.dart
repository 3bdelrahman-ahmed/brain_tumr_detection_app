import 'package:brain_tumr_detection_app/features/doctors/data/models/reviews_model.dart';

class GetReviewsResponse {
  int pageIndex;
  int pageSize;
  int count;
  int totalPages;
  List<Review> data;

  GetReviewsResponse({
    required this.pageIndex,
    required this.pageSize,
    required this.count,
    required this.totalPages,
    required this.data,
  });

  factory GetReviewsResponse.fromJson(Map<String, dynamic> json) {
    return GetReviewsResponse(
      pageIndex: json['pageIndex'],
      pageSize: json['pageSize'],
      count: json['count'],
      totalPages: json['totalPages'],
      data: List<Review>.from(json['data'].map((x) => Review.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pageIndex': pageIndex,
      'pageSize': pageSize,
      'count': count,
      'totalPages': totalPages,
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}
