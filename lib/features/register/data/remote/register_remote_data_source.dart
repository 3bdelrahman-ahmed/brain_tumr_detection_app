import 'package:brain_tumr_detection_app/features/register/data/models/register_model.dart';
import 'package:brain_tumr_detection_app/foundations/app_urls.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/network_services/api_service.dart';
@singleton
class RegisterRemoteDataSource {
  Future<RegisterResponseModel> register(RegisterRequestModel parameters) async {
    final formData = await parameters.toFormData();
    final response = await AppDio().post(
      path: AppUrls.registerPatient,
      data: formData,
    );      
    return RegisterResponseModel.fromJson(response.data);
  }
}
