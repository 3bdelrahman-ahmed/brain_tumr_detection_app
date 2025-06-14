
import 'package:brain_tumr_detection_app/features/profle/data/models/saved_posts_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/network_services/api_service.dart';
import '../../../../foundations/app_urls.dart';

@singleton
class SettingsRemoteDataSourec {

  Future<String> forgetPassword(String email) async {
    final response = await AppDio()
        .post(path: AppUrls.forgetPassword, data: {"email": email});
    return response.data['email'];
  }


  Future<SavedPostsResponseModel> getSavedPosts(SavedPostsRequestModel query) async {
    final response = await AppDio().get(path: AppUrls.savedPosts, queryParams: query.toJson());
    return SavedPostsResponseModel.fromJson(response.data);
  }
}