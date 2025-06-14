class ToggleSaveRequestModel {
  final String postId;

  ToggleSaveRequestModel({required this.postId});
  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
    };
  }
}


class ToggleSaveResponseModel {
  bool? isSaved;
  int? postId;

  ToggleSaveResponseModel({this.isSaved, this.postId});

  ToggleSaveResponseModel.fromJson(Map<String, dynamic> json) {
    isSaved = json['isSaved'];
    postId = json['postId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSaved'] = this.isSaved;
    data['postId'] = this.postId;
    return data;
  }
}
