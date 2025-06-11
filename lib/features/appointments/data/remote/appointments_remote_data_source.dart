import 'package:brain_tumr_detection_app/core/data/network_services/api_service.dart';
import 'package:brain_tumr_detection_app/features/appointments/data/models/appointments_model.dart';
import 'package:brain_tumr_detection_app/foundations/app_urls.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppointmentsRemoteDataSource {
  Future<AppointmentsResponseModel> getPatientAppointments(AppointmentsRequestModel query) async {
    final response = await AppDio().get(path: AppUrls.getPatientAppointments, queryParams: query.toJson());

    return AppointmentsResponseModel.fromJson(response.data);
  }
}
