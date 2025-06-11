import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/features/doctors/data/models/get_reviews_request_model.dart';
import 'package:brain_tumr_detection_app/features/doctors/data/models/reviews_model.dart';
import 'package:brain_tumr_detection_app/features/doctors/data/repository/reviews_repository.dart';
import 'package:brain_tumr_detection_app/features/slots/data/model/available_slots.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/models/get_slots.dart';

part 'doctors_state.dart';

@injectable
class DoctorsCubit extends Cubit<DoctorsState> {
  final DoctorAppointmentRepository repository;
  DateTime selectedDay = DateTime.now();

  DoctorsCubit(this.repository) : super(ShowDoctorsInitial()) {}
  List<Review> reviews = [];

  Future<void> fetchReviews({required int doctorId}) async {
    emit(ShowDoctorsLoading());

    final request = GetReviewsRequestModel(
      doctorId: doctorId,
      pageIndex: 1,
      pageSize: 10,
    );

    final result = await repository.getDoctorReview(request);

    result.fold(
        (error) => emit(ShowDoctorsError(error.message ?? "Unknown error")),
        (response) {
      reviews = response.data;
      emit(ShowDoctorsLoaded());
    });
  }

  void fetchAvailableSlots(
      {required AvailablePatientSlotsRequestModel request}) async {
    emit(GetAvailableDoctorsLoading());
    final result = await repository.getDoctorAvailableSlots(request);
    result.fold(
        (error) => emit(ShowDoctorsError(error.message ?? "Unknown error")),
        (slots) {
      final availableSlots =
          slots.where((slot) => slot.isAvailable == true).toList();
      if (slots.isNotEmpty) {
        print(slots[0].dayOfWeek);
      }
      emit(GetAvailableDoctorsSuccess(availableSlots));
    });
  }

  Future<void> bookAppointment(
      {required AvailablePatientSlotsRequestModel request}) async {
    emit(GetAvailableDoctorsLoading());
    final result = await repository.bookAppointment(request);
    result.fold(
        (error) => emit(ShowDoctorsError(error.message ?? "Unknown error")),
        (slot) {
      emit(BookAppointmentSuccess(slot));
    });
  }
}
