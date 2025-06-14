import 'package:brain_tumr_detection_app/core/data/network_services/api_error_handler.dart';
import 'package:brain_tumr_detection_app/features/feed/data/remote/feed_remote_data_sourec.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../models/posts_response_model.dart';
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
}