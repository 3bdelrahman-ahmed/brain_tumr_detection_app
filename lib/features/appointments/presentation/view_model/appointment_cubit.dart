import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/features/appointments/data/models/appointments_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/repo/appointments_repository.dart';

part 'appointment_state.dart';

@injectable
class AppointmentCubit extends Cubit<AppointmentState> {
  final AppointmentsRepository appointmentRepository;
  AppointmentCubit({required this.appointmentRepository})
      : super(AppointmentInitial());

  AppointmentsResponseModel? appointmentsResponseModel;
  int pageSize = 10;
  int pageIndex = 1;
  Future<void> getPatientAppointments() async {
    emit(AppointmentLoading());
    final response = await appointmentRepository.getPatientAppointments(
      AppointmentsRequestModel(
        pageIndex: pageIndex,
        pageSize: pageSize,
      ),
    );
    response.fold(
      (error) => emit(AppointmentError()),
      (data) {
        appointmentsResponseModel = data;
        emit(AppointmentLoaded());
      },
    );
  }
}
