import 'package:brain_tumr_detection_app/features/verification_code/data/models/verification_code_model.dart';
import 'package:brain_tumr_detection_app/foundations/app_urls.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/network_services/api_service.dart';
import '../models/login_model.dart';

@singleton
class LoginRemoteDataSource {
  Future<LoginResponseModel> login(LoginRequestModel parameters) async {
    final response =
        await AppDio().post(path: AppUrls.login, data: parameters.toJson());
    return LoginResponseModel.fromJson(response.data);
  }

  Future<String> forgetPassword(String email) async {
    final response = await AppDio()
        .post(path: AppUrls.forgetPassword, data: {"email": email});
    return response.data['email'];
  }
}
