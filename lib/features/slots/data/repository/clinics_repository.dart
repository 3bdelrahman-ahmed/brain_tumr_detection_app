import 'package:brain_tumr_detection_app/core/data/network_services/api_error_handler.dart';
import 'package:brain_tumr_detection_app/features/slots/data/remote/clinics_remote_ds.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../model/clinic.dart';

@singleton
class ClinicsRepository {
  ClinicsRemoteDataSource clinicsRemoteDataSource;
  ClinicsRepository({required this.clinicsRemoteDataSource});
  Future<Either<ApiErrorModel, List<Clinic>>>getDoctorClinics() async {
    try {
      final response = await clinicsRemoteDataSource.getDoctorClinics();
      return Right(response);
    }
    on Exception catch(e){
      return Left(ErrorHandler.handle(e));
    }
  }
}
