class DeleteCommentRequestModel {
  final String commentId;

  DeleteCommentRequestModel({required this.commentId});

  Map<String, dynamic> toJson() {
    return {
      'comment_id': commentId,
    };
  }


}


class DeleteCommentResponseModel {
  final int commentId;

  DeleteCommentResponseModel({required this.commentId});

  factory DeleteCommentResponseModel.fromJson(Map<String, dynamic> json) {
    return DeleteCommentResponseModel(
      commentId: json['message'] ?? 0,
    );
  }
}