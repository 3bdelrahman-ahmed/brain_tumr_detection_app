import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/features/appointments/data/models/appointments_model.dart';
import 'package:flutter/material.dart';
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
  bool isLoadingMore = false;
  final ScrollController scrollController = ScrollController();

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

        // Sort: Move "Completed" and "Cancelled" to the bottom
        appointmentsResponseModel?.appointments?.sort((a, b) {
          final aIsFinished =
              a.status == "Completed" || a.status == "Cancelled";
          final bIsFinished =
              b.status == "Completed" || b.status == "Cancelled";
          return aIsFinished == bIsFinished ? 0 : (aIsFinished ? 1 : -1);
        });

        pageIndex = data.pageIndex ?? pageIndex;
        emit(AppointmentLoaded());
      },
    );
  }

  Future<void> loadMoreAppointments() async {
    if (isLoadingMore) return;
    isLoadingMore = true;
    pageIndex++;
    final response = await appointmentRepository.getPatientAppointments(
      AppointmentsRequestModel(
        pageIndex: pageIndex,
        pageSize: pageSize,
      ),
    );
    response.fold(
      (error) {
        isLoadingMore = false;
        emit(AppointmentError());
      },
      (data) {
        appointmentsResponseModel?.appointments!.addAll(data.appointments!);

        // Prevent duplicate page increase on empty response
        if (data.appointments!.isEmpty) {
          pageIndex = pageIndex - 1;
        }

        // Sort again after adding more appointments
        appointmentsResponseModel?.appointments?.sort((a, b) {
          final aIsFinished =
              a.status == "Completed" || a.status == "Cancelled";
          final bIsFinished =
              b.status == "Completed" || b.status == "Cancelled";
          return aIsFinished == bIsFinished ? 0 : (aIsFinished ? 1 : -1);
        });

        isLoadingMore = false;
        emit(AppointmentLoaded());
      },
    );
  }

  void removeAppointment(int index) {
    appointmentsResponseModel?.appointments?.removeAt(index);
    emit(AppointmentCancelled());
  }
}
