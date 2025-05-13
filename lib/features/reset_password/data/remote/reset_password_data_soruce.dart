import 'package:brain_tumr_detection_app/core/data/network_services/api_service.dart';
import 'package:brain_tumr_detection_app/features/reset_password/data/model/reset_password_request_model.dart';
import 'package:brain_tumr_detection_app/foundations/app_urls.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordDataSource {
  Future<String> resetPassword(ResetPasswordRequestModel request) async {
    final response = await AppDio()
        .post(path: AppUrls.resetPassword, data: request.toJson());
    return response.data['message'];
  }
}
