class PostsResponseModel {
  List<Posts>? posts;
  int? nextCursor;

  PostsResponseModel({this.posts, this.nextCursor});

  PostsResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      posts = <Posts>[];
      json['data'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
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

class Posts {
  int? id;
  String? userId;
  String? title;
  String? content;
  bool? isLiked;
  bool? isSaved;
  int? likesCount;
  int? commentsCount;
  String? userName;
  String? userProfilePicture;
  String? createdAt;

  Posts(
      {this.id,
      this.title,
      this.content,
      this.isLiked,
      this.isSaved,
      this.likesCount,
      this.commentsCount,
      this.userName,
      this.userProfilePicture,
      this.userId,
      this.createdAt});

  Posts.fromJson(Map<String, dynamic> json) {
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
    userId = json['userId'];
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
    data['userId'] = this.userId;
    return data;
  }
}

class PostsRequestModel {
  int? cursor;

  PostsRequestModel({this.cursor,});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cursor'] = this.cursor;
    return data;
  }
}
