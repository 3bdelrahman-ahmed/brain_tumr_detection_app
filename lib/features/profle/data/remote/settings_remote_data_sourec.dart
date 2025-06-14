
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
}