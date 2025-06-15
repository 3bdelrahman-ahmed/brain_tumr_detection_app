class ReviewRequestModel {
  final String doctorId;
  final int rating;
  final String comment;

  ReviewRequestModel({
    required this.doctorId,
    required this.rating,
    required this.comment,
  });

  Map<String, dynamic> toJson() {
    return {
      'doctorId': doctorId,
      'stars': rating,
      'comment': comment,
    };
  }
}

class ReviewResponseModel {
  final String message;

  ReviewResponseModel({
    required this.message,
  });

  factory ReviewResponseModel.fromJson(Map<String, dynamic> json) {
    return ReviewResponseModel(
      message: json['message'] ?? '',
    );
  }
}
