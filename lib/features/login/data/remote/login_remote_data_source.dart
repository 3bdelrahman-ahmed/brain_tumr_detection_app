import 'package:brain_tumr_detection_app/foundations/app_urls.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/network_services/api_service.dart';
import '../models/login_model.dart';
@injectable
class LoginRemoteDataSource {
  Future<LoginResponseModel> login(LoginRequestModel parameters) async {
    final response =
        await AppDio().post(path: AppUrls.login, data: parameters.toJson());
    return LoginResponseModel.fromJson(response.data);
  }
}