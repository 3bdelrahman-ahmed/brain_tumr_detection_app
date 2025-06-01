import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/features/appointments/data/models/appointment_model.dart';
import 'package:brain_tumr_detection_app/features/appointments/data/repository/Appointments_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'appointment_state.dart';

@injectable
class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit(this.appointmentsRepository) : super(AppointmentInitial()) {
    getPatientAppointments();
  }

  final AppointmentsRepository appointmentsRepository;

  int pageSize = 15;
  int pageIndex = 1;
  bool isLoadingMore = false;
  bool hasMore = true;

  List<AppointmentData> appointments = [];

  Future<void> getPatientAppointments() async {
    emit(AppointmentLoading());
    pageIndex = 1;
    hasMore = true;
    final result = await appointmentsRepository.getAllPatientAppointments(
      AppointmentModelRequest(
        pageIndex: pageIndex,
        pageSize: pageSize,
      ),
    );

    result.fold(
          (error) => emit(GetAppointmentsFailed()),
          (response) {
        appointments = response.data;

        // Sort: push completed appointments to end
        appointments.sort((a, b) {
          final aInactive = a.status == "Completed" || a.status == "Cancelled";
          final bInactive = b.status == "Completed" || b.status == "Cancelled";

          if (aInactive == bInactive) return 0;
          return aInactive ? 1 : -1;
        });


        hasMore = response.data.length == pageSize;
        emit(GetAppointmentsSuccess());
      },
    );
  }

  Future<void> loadMoreAppointments() async {
    if (isLoadingMore || !hasMore) return;

    isLoadingMore = true;
    pageIndex++;

    final result = await appointmentsRepository.getAllPatientAppointments(
      AppointmentModelRequest(
        pageIndex: pageIndex,
        pageSize: pageSize,
      ),
    );

    result.fold(
          (error) {
        emit(GetAppointmentsFailed());
        isLoadingMore = false;
      },
          (response) {
        appointments.addAll(response.data);

        appointments.sort((a, b) {
          final aInactive = a.status == "Completed" || a.status == "Canceled";
          final bInactive = b.status == "Completed" || b.status == "Canceled";

          if (aInactive == bInactive) return 0;
          return aInactive ? 1 : -1;
        });


        hasMore = response.data.length == pageSize;
        isLoadingMore = false;
        emit(GetAppointmentsSuccess());
      },
    );
  }
}