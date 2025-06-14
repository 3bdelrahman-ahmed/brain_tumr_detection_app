class CommentsResponseModel {
  List<Comment>? data;
  int? nextCursor;

  CommentsResponseModel({this.data, this.nextCursor});

  CommentsResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Comment>[];
      json['data'].forEach((v) {
        data!.add(new Comment.fromJson(v));
      });
    }
    nextCursor = json['nextCursor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['nextCursor'] = this.nextCursor;
    return data;
  }
}

class Comment {
  int? id;
  String? text;
  String? createdAt;
  String? userId;
  String? userName;
  String? userProfilePicture;

  Comment(
      {this.id,
      this.text,
      this.createdAt,
      this.userId,
      this.userName,
      this.userProfilePicture});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    createdAt = json['createdAt'];
    userId = json['userId'];
    userName = json['userName'];
    userProfilePicture = json['userProfilePicture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['createdAt'] = this.createdAt;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['userProfilePicture'] = this.userProfilePicture;
    return data;
  }
}

class CommentsRequestModel {
  final String postId;
  final int cursor;

  CommentsRequestModel({required this.postId, required this.cursor });
  Map<String, dynamic> toJson() {
    return {
      'cursor': cursor,
    };
  }
}
