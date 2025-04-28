import 'package:brain_tumr_detection_app/core/data/models/get_doctor_request_model.dart';
import 'package:brain_tumr_detection_app/core/data/models/get_doctor_response.dart';
import 'package:brain_tumr_detection_app/core/data/network_services/api_service.dart';
import 'package:brain_tumr_detection_app/foundations/app_urls.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetDoctorsClinicsDataSource {
  Future<GetDoctorResponseModel> getAllDoctorsClinics(
      GetDoctorRequestModel getDoctorRequestModel) async {
    final response = await AppDio().get(
        path: AppUrls.getAllDoctorsClinics,
        queryParams: getDoctorRequestModel.toJson());

    return GetDoctorResponseModel.fromJson(response.data);
  }
}
