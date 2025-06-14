import 'package:brain_tumr_detection_app/core/data/network_services/api_service.dart';
import 'package:brain_tumr_detection_app/features/feed/data/models/add_comments_model.dart';
import 'package:brain_tumr_detection_app/features/feed/data/models/comments_model.dart';
import 'package:brain_tumr_detection_app/features/feed/data/models/delete_comment_model.dart';
import 'package:brain_tumr_detection_app/features/feed/data/models/posts_response_model.dart';
import 'package:brain_tumr_detection_app/features/feed/data/models/toggle_like_model.dart';
import 'package:brain_tumr_detection_app/features/feed/data/models/toggle_save_model.dart';
import 'package:brain_tumr_detection_app/foundations/app_urls.dart';
import 'package:injectable/injectable.dart';

import '../models/delete_post_model.dart';

@singleton
class FeedRemoteDataSourec {
  Future<PostsResponseModel> getPosts(PostsRequestModel query) async {
    final response =
        await AppDio().get(path: AppUrls.post, queryParams: query.toJson());
    return PostsResponseModel.fromJson(response.data);
  }

  Future<ToggleLikeResponseModel> toggleLike(
      ToggleLikeRequestModel request) async {
    final response = await AppDio().post(
      path: "${AppUrls.toggleLike}/${request.postId}",
    );
    return ToggleLikeResponseModel.fromJson(response.data);
  }

  Future<ToggleSaveResponseModel> toggleSave(
      ToggleSaveRequestModel request) async {
    final response = await AppDio().post(
      path: "${AppUrls.toggleSave}/${request.postId}",
    );
    return ToggleSaveResponseModel.fromJson(response.data);
  }

  Future<CommentsResponseModel> fetchPostComments(
      CommentsRequestModel request) async {
    final response = await AppDio().get(
      path: "${AppUrls.comments}/${request.postId}",
      queryParams: request.toJson(),
    );
    return CommentsResponseModel.fromJson(response.data);
  }

  Future<AddCommentsResponseModel> addComment(
      AddCommentsRequestModel request) async {
    final response = await AppDio().post(
      path: "${AppUrls.addComment}/${request.postId}",
      data: request.toJson(),
    );
    return AddCommentsResponseModel.fromJson(response.data);
  }

  Future<DeleteCommentResponseModel> deleteComment(
      DeleteCommentRequestModel request) async {
    final response = await AppDio().delete(
      path: "${AppUrls.addComment}/${request.commentId}",
    );
    return DeleteCommentResponseModel.fromJson(response.data);
  }

  Future<DeletePostResponseModel> deletePost(
      DeletePostRequestModel request) async {
    final response = await AppDio().delete(
      path: "${AppUrls.post}/${request.postId}",
    );
    return DeletePostResponseModel.fromJson(response.data);
  }
}
