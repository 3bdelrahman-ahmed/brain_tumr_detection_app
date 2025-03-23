import 'package:brain_tumr_detection_app/core/data/network_services/api_service.dart';
import 'package:brain_tumr_detection_app/foundations/app_urls.dart';
import 'package:injectable/injectable.dart';

import '../models/verification_code_model.dart';

@singleton
class VerifyCodeRemoteDataSource {
  Future<String> verifyCode(VerificationCodeRequestModel body) async {
    final response = await AppDio().post(path: AppUrls.verifyCode,
    data: body.toJson()
    );
    return response.data['message'];
  }
}
