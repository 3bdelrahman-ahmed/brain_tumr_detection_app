import 'package:brain_tumr_detection_app/features/appointments/data/models/appointment_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/network_services/api_service.dart';
import '../../../../foundations/app_urls.dart';

@injectable
class AppointmentsDataSource {
  Future<AppointmentModelResponse> getPatientAppointments(
      AppointmentModelRequest request) async {
    final response = await AppDio().get(
        path: AppUrls.getBookedAppointments, queryParams: request.toJson());
    return AppointmentModelResponse.fromJson(response.data);
  }
}
