import 'package:brain_tumr_detection_app/core/data/network_services/api_error_handler.dart';
import 'package:brain_tumr_detection_app/features/clincs_management/data/remote/clinic_management_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../models/add_clinic_model.dart';

@singleton
class ClinicManagementRepository {
  final ClinicManagementRemoteDataSource remoteDataSource;
  ClinicManagementRepository({required this.remoteDataSource});

  Future<Either<ApiErrorModel, AddClinicResponseModel>> addClinic(
      AddClinicRequestModel requestModel) async {
    try {
      final response = await remoteDataSource.addClinic(requestModel);
      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }
}
