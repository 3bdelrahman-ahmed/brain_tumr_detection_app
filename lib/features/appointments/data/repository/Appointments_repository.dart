import 'package:brain_tumr_detection_app/features/appointments/data/models/appointment_model.dart';
import 'package:brain_tumr_detection_app/features/appointments/data/remote/appointment_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/network_services/api_error_handler.dart';

@injectable
class AppointmentsRepository {
  AppointmentsDataSource appointmentsDataSource;

  AppointmentsRepository(this.appointmentsDataSource);

  Future<Either<ApiErrorModel, AppointmentModelResponse>>
      getAllPatientAppointments(AppointmentModelRequest request) async {
    try {
      final response =
          await appointmentsDataSource.getPatientAppointments(request);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
