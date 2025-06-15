import 'package:brain_tumr_detection_app/core/data/network_services/api_service.dart';
import 'package:brain_tumr_detection_app/features/clincs_management/data/models/add_clinic_model.dart';
import 'package:brain_tumr_detection_app/foundations/app_urls.dart';
import 'package:injectable/injectable.dart';

@singleton
class ClinicManagementRemoteDataSource {
  Future<AddClinicResponseModel> addClinic(
      AddClinicRequestModel requestModel) async {
    final response = await AppDio()
        .post(path: AppUrls.addClinic, data: await requestModel.toFormData());

        return AddClinicResponseModel.fromJson(response.data);
  }
}
