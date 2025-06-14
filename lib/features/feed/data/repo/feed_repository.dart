import 'package:brain_tumr_detection_app/core/data/network_services/api_error_handler.dart';
import 'package:brain_tumr_detection_app/features/feed/data/remote/feed_remote_data_sourec.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../models/add_comments_model.dart';
import '../models/comments_model.dart';
import '../models/delete_comment_model.dart';
import '../models/delete_post_model.dart';
import '../models/posts_response_model.dart';
import '../models/toggle_like_model.dart';
import '../models/toggle_save_model.dart';
@singleton
class FeedRepository {
  final FeedRemoteDataSourec remoteDataSource;

  FeedRepository({required this.remoteDataSource});

  Future<Either<ApiErrorModel, PostsResponseModel>> getPosts(PostsRequestModel query) async {
    try {
      final response = await remoteDataSource.getPosts(query);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }


  Future<Either<ApiErrorModel, ToggleLikeResponseModel>> toggleLike(ToggleLikeRequestModel request) async {
    try {
      final response = await remoteDataSource.toggleLike(request);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }


  Future<Either<ApiErrorModel, ToggleSaveResponseModel>> toggleSave(ToggleSaveRequestModel request) async {
    try {
      final response = await remoteDataSource.toggleSave(request);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, CommentsResponseModel>> fetchPostComments(CommentsRequestModel request) async {
    try {
      final response = await remoteDataSource.fetchPostComments(request);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, AddCommentsResponseModel>> addComment(AddCommentsRequestModel request) async {
    try {
      final response = await remoteDataSource.addComment(request);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, DeleteCommentResponseModel>> deleteComment(DeleteCommentRequestModel request) async {
    try {
      final response = await remoteDataSource.deleteComment(request);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, DeletePostResponseModel>> deletePost(DeletePostRequestModel request) async {
    try {
      final response = await remoteDataSource.deletePost(request);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}