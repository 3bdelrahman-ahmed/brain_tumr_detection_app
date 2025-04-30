import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/features/doctors/data/models/get_reviews_request_model.dart';
import 'package:brain_tumr_detection_app/features/doctors/data/models/get_reviews_response_model.dart';
import 'package:brain_tumr_detection_app/features/doctors/data/models/reviews_model.dart';
import 'package:brain_tumr_detection_app/features/doctors/data/repository/reviews_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'show_doctors_state.dart';

@injectable
class ShowDoctorsCubit extends Cubit<ShowDoctorsState> {
  final ReviewsRepository repository;

  ShowDoctorsCubit(this.repository) : super(ShowDoctorsInitial()) {}
  List<Review>? reviews;

  void fetchReviews({required int doctorId}) async {
    emit(ShowDoctorsLoading());

    final request = GetReviewsRequestModel(
      doctorId: doctorId,
      pageIndex: 1,
      pageSize: 10,
    );

    final result = await repository.getDoctorReview(request, doctorId);

    result.fold(
        (error) => emit(ShowDoctorsError(error.message ?? "Unknown error")),
        (response) {
      reviews = response.data;
      emit(ShowDoctorsLoaded());
    });
  }
}
