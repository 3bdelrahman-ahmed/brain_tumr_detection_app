import 'package:brain_tumr_detection_app/core/data/network_services/api_error_handler.dart';
import 'package:brain_tumr_detection_app/core/data/network_services/api_service.dart';
import 'package:brain_tumr_detection_app/features/slots/data/model/clinic.dart';
import 'package:brain_tumr_detection_app/foundations/app_urls.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../foundations/app_constants.dart';

@singleton
class ClinicsRemoteDataSource {
  Future<List<Clinic>> getDoctorClinics() async {
    final response = await AppDio().get(path: AppUrls.getDoctorClinics);
    final List<dynamic> clinicsJson = response.data;
    return clinicsJson.map((json) => Clinic.fromJson(json)).toList();
  }
}
