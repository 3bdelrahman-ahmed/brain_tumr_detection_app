class AddCommentsRequestModel {
  final String postId;

  final String comment;
  AddCommentsRequestModel({required this.postId, required this.comment});
  Map<String, dynamic> toJson() {
    return {
      'text': comment,
    };
  }
}

class AddCommentsResponseModel {
  int? id;




  AddCommentsResponseModel({this.id});
  AddCommentsResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['message'];
  }
}
