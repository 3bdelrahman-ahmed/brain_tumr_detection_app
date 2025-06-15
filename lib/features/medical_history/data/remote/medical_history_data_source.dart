import 'package:brain_tumr_detection_app/core/data/models/doctor_clinic_model.dart';
import 'package:brain_tumr_detection_app/core/data/network_services/api_service.dart';
import 'package:brain_tumr_detection_app/features/appointments/data/models/appointments_model.dart';
import 'package:brain_tumr_detection_app/features/appointments/data/models/delete_appointment_model.dart';
import 'package:brain_tumr_detection_app/features/medical_history/data/model/detection_response.dart';
import 'package:brain_tumr_detection_app/foundations/app_urls.dart';
import 'package:injectable/injectable.dart';

@singleton
class MedicalHistoryDataSource {
  Future<DetectionResponse> getPatientScans(DetectionRequest query) async {
    final response =
        await AppDio().get(path: AppUrls.getScans, queryParams: query.toJson());

    return DetectionResponse.fromJson(response.data);
  }

  Future<DoctorClinicModel> getDoctorById(String doctorId) async {
    final response = await AppDio().get(
      path: "${AppUrls.getDoctorById}$doctorId"
    );
    print("Response ::: ${response.data}");
    return DoctorClinicModel.fromJson(response.data);
  }
}
