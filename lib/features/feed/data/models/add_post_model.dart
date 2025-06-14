class AddPostRequestModel {
  final String title;
  final String content;

  AddPostRequestModel({
    required this.title,
    required this.content,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
    };
  }
}


class AddPostResponseModel {
  final int postId;

  AddPostResponseModel({required this.postId});

  factory AddPostResponseModel.fromJson(Map<String, dynamic> json) {
    return AddPostResponseModel(
      postId: json['message'] ?? 0,
    );
  }
}