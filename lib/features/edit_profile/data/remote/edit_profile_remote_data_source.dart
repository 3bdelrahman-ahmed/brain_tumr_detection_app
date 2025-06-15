import 'package:brain_tumr_detection_app/core/data/network_services/api_service.dart';
import 'package:brain_tumr_detection_app/features/edit_profile/data/models/edit_profile_model.dart';
import 'package:brain_tumr_detection_app/foundations/app_urls.dart';
import 'package:injectable/injectable.dart';

@singleton
class EditProfileRemoteDataSource {
  Future<EditProfileResponseModel> editProfile(
      EditProfileRequestModel body) async {
    final response = await AppDio()
        .post(path: "AppUrls.editProfile", data: await body.toFormData());

        return EditProfileResponseModel.fromJson(response.data);
  }
}
