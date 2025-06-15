import 'package:brain_tumr_detection_app/core/data/network_services/api_error_handler.dart';
import 'package:brain_tumr_detection_app/features/doctors/data/models/get_reviews_request_model.dart';
import 'package:brain_tumr_detection_app/features/doctors/data/models/get_reviews_response_model.dart';
import 'package:brain_tumr_detection_app/features/doctors/data/remote/reviews_data_source.dart';
import 'package:brain_tumr_detection_app/features/slots/data/model/available_slots.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../models/get_slots.dart';

@injectable
class DoctorAppointmentRepository {
  DoctorAppointmentDataSource reviewsDataSource;

  DoctorAppointmentRepository(this.reviewsDataSource);

  Future<Either<ApiErrorModel, GetReviewsResponse>> getDoctorReview(
      GetReviewsRequestModel getReviewRequestModel) async {
    try {
      final response = await reviewsDataSource.getDoctorReviews(
          getReviewRequestModel);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, List<AvailableSlotsModel>>>
      getDoctorAvailableSlots(AvailablePatientSlotsRequestModel request) async {
    try {
      final response = await reviewsDataSource.getDoctorAvailableSlots(request);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, AvailablePatientSlotsResponseModel>>
      bookAppointment(AvailablePatientSlotsRequestModel request) async {
    try {
      final response = await reviewsDataSource.bookAppointment(request);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
