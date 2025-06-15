class SavedPostsResponseModel {
  List<SavedPost>? posts;
  int? nextCursor;

  SavedPostsResponseModel({this.posts, this.nextCursor});

  SavedPostsResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      posts = <SavedPost>[];
      json['data'].forEach((v) {
        posts!.add(new SavedPost.fromJson(v));
      });
    }
    nextCursor = json['nextCursor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['data'] = this.posts!.map((v) => v.toJson()).toList();
    }
    data['nextCursor'] = this.nextCursor;
    return data;
  }
}

class SavedPost {
  int? id;
  String? title;
  String? content;
  bool? isLiked;
  bool? isSaved;
  int? likesCount;
  int? commentsCount;
  String? userName;
  String? userProfilePicture;
  String? createdAt;

  SavedPost(
      {this.id,
      this.title,
      this.content,
      this.isLiked,
      this.isSaved,
      this.likesCount,
      this.commentsCount,
      this.userName,
      this.userProfilePicture,
      this.createdAt});

  SavedPost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    isLiked = json['isLiked'];
    isSaved = json['isSaved'];
    likesCount = json['likesCount'];
    commentsCount = json['commentsCount'];
    userName = json['userName'];
    userProfilePicture = json['userProfilePicture'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['isLiked'] = this.isLiked;
    data['isSaved'] = this.isSaved;
    data['likesCount'] = this.likesCount;
    data['commentsCount'] = this.commentsCount;
    data['userName'] = this.userName;
    data['userProfilePicture'] = this.userProfilePicture;
    data['createdAt'] = this.createdAt;
    return data;
  }
}


class SavedPostsRequestModel {
  int? cursor;

  SavedPostsRequestModel({this.cursor,});

  Map<String, dynamic> toJson() {
    return {
      'cursor': cursor,
    };
  }
}
