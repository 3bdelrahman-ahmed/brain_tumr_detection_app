import 'package:brain_tumr_detection_app/core/data/network_services/api_error_handler.dart';
import 'package:brain_tumr_detection_app/features/appointments/data/models/appointments_model.dart';
import 'package:brain_tumr_detection_app/features/appointments/data/models/delete_appointment_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../remote/appointments_remote_data_source.dart';

@singleton
class AppointmentsRepository {
  final AppointmentsRemoteDataSource remoteDataSource;

  AppointmentsRepository({required this.remoteDataSource});

  Future<Either<ApiErrorModel, AppointmentsResponseModel>>
      getPatientAppointments(AppointmentsRequestModel query) async {
    try {
      final response = await remoteDataSource.getPatientAppointments(query);
      return Right(response);
    } on Exception catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }

  Future<Either<ApiErrorModel,DeleteAppointmentResponseModel>> deleteAppointment(DeleteAppointmentRequestModel query)async{
    try {
      final response = await remoteDataSource.deleteAppointment(query);
      return Right(response);
    } on Exception catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }
}
