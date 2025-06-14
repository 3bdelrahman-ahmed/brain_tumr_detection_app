import 'package:brain_tumr_detection_app/core/data/network_services/api_service.dart';
import 'package:brain_tumr_detection_app/features/feed/data/models/posts_response_model.dart';
import 'package:brain_tumr_detection_app/foundations/app_urls.dart';
import 'package:injectable/injectable.dart';

@singleton
class FeedRemoteDataSourec {
  Future<PostsResponseModel> getPosts(PostsRequestModel query) async {
    final response = await AppDio().get(path: AppUrls.post,queryParams: query.toJson());
    return PostsResponseModel.fromJson(response.data);
  }
}
