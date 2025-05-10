import 'package:brain_tumr_detection_app/core/data/network_services/api_service.dart';
import 'package:injectable/injectable.dart';

import '../../../../foundations/app_urls.dart';
import '../model/view_patient_response_model/view_patient_response_model.dart';
@singleton
class ViewPatientsDataSource {
  ViewPatientsDataSource();

  Future<List<ViewPatientResponseModel>> getPatients(clinicId,date) async {
    final response =await AppDio().get(path: AppUrls.getPatients(clinicId),queryParams: {
      'date': date.toString().split(' ')[0],
    });
  
    return (response.data as List<dynamic>)
        .map((e) => ViewPatientResponseModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
