class DeletePostRequestModel {
  final String postId;

  DeletePostRequestModel({required this.postId});

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
    };
  }
}

class DeletePostResponseModel {
  final int postId;

  DeletePostResponseModel({required this.postId});

  factory DeletePostResponseModel.fromJson(Map<String, dynamic> json) {
    return DeletePostResponseModel(
      postId: json['message'] ?? '',
    );
  }
}
