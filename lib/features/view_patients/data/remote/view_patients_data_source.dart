import 'package:brain_tumr_detection_app/core/data/network_services/api_service.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/local_services/cached_models/clinics_model.dart';
import '../../../../foundations/app_urls.dart';
import '../model/get_chat_id_model/get_chat_id_model.dart';
import '../model/view_patient_response_model/view_patient_response_model.dart';

@singleton
class ViewPatientsDataSource {
  ViewPatientsDataSource();

  Future<List<ViewPatientResponseModel>> getPatients(clinicId, date) async {
    final response =
        await AppDio().get(path: AppUrls.getPatients(clinicId), queryParams: {
      'date': date.toString().split(' ')[0],
    });

    return (response.data as List<dynamic>)
        .map(
            (e) => ViewPatientResponseModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<GetChatIdModel> getConversationId(String patientId) async {
    final response =
        await AppDio().get(path: AppUrls.getConversationId(patientId));
    print(response.data);
    return GetChatIdModel.fromJson(response.data);
  }


    Future<List<Clinic>> getDoctorClinics() async {
    final response = await AppDio().get(path: AppUrls.getDoctorClinics);
    final List<dynamic> clinicsJson = response.data;
    return clinicsJson.map((json) => Clinic.fromJson(json)).toList();
  }
}
