import 'package:brain_tumr_detection_app/core/data/network_services/api_error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../model/view_patient_response_model/view_patient_response_model.dart';
import '../remote/view_patients_data_source.dart';
@singleton
class ViewPatientsRepo {
  final ViewPatientsDataSource remoteDataSource;

  ViewPatientsRepo(this.remoteDataSource);

  Future<Either<ApiErrorModel,List<ViewPatientResponseModel>>> getPatients(clinicId, DateTime date) async {
    try {
      final response = await remoteDataSource.getPatients(clinicId, date);
      return Right(response);
} catch (e) {
  print(e);
  return Left(ErrorHandler.handle(e));
}
  
  }

}