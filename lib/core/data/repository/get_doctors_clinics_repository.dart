import 'package:brain_tumr_detection_app/core/data/models/get_doctor_request_model.dart';
import 'package:brain_tumr_detection_app/core/data/models/get_doctor_response.dart';
import 'package:brain_tumr_detection_app/core/data/network_services/api_error_handler.dart';
import 'package:brain_tumr_detection_app/core/data/remote/get_doctors_clinics_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetDoctorsClinicsRepository {
  GetDoctorsClinicsDataSource getDoctorsClinicsDataSource;

  GetDoctorsClinicsRepository(this.getDoctorsClinicsDataSource);

  Future<Either<ApiErrorModel, GetDoctorResponseModel>> getDoctorsClinics(
      GetDoctorRequestModel getDoctorRequestModel) async {
    try {
      final response = await getDoctorsClinicsDataSource
          .getAllDoctorsClinics(getDoctorRequestModel);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
