import 'package:brain_tumr_detection_app/features/register/data/models/register_model.dart';
import 'package:brain_tumr_detection_app/features/register/data/remote/register_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/network_services/api_error_handler.dart';

@singleton
class RegisterRepository {
  final RegisterRemoteDataSource dataSource;
  RegisterRepository({required this.dataSource});

  Future<Either<ApiErrorModel, RegisterResponseModel>> patientRegister(
      PatientRegisterRequestModel parameters) async {
    try {
      final RegisterResponseModel response =
          await dataSource.patientRegister(parameters);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, RegisterResponseModel>> doctorRegister(
      DoctorRegisterRequestModel parameters) async {
    try {
      final RegisterResponseModel response =
          await dataSource.doctorRegister(parameters);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

// Future<Either<ApiErrorModel,String>> sentDiviceToken(String token) async {
//   try {
//     final respons = await dataSource.sentDeviceToken(token);
//     return Right(respons);
//   } on Exception catch (e) {
//     return Left(ErrorHandler.handle(e));
//   }
// }
}
