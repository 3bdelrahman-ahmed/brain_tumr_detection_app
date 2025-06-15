class ToggleLikeRequestModel {
  final String postId;

  ToggleLikeRequestModel({required this.postId});
  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
    };
  }
}

class ToggleLikeResponseModel {
  bool? isLiked;
  int? postId;

  ToggleLikeResponseModel({this.isLiked, this.postId});

  ToggleLikeResponseModel.fromJson(Map<String, dynamic> json) {
    isLiked = json['isLiked'];
    postId = json['postId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isLiked'] = this.isLiked;
    data['postId'] = this.postId;
    return data;
  }
}
