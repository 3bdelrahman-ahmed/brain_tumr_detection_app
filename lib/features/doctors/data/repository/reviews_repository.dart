import 'package:brain_tumr_detection_app/core/data/network_services/api_error_handler.dart';
import 'package:brain_tumr_detection_app/features/doctors/data/models/get_reviews_request_model.dart';
import 'package:brain_tumr_detection_app/features/doctors/data/models/get_reviews_response_model.dart';
import 'package:brain_tumr_detection_app/features/doctors/data/remote/reviews_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReviewsRepository {
  ReviewsDataSource reviewsDataSource;

  ReviewsRepository(this.reviewsDataSource);

  Future<Either<ApiErrorModel, GetReviewsResponse>> getDoctorReview(
      GetReviewsRequestModel getReviewRequestModel, int doctorId) async {
    try {
      final response = await reviewsDataSource.getDoctorReviews(
          getReviewRequestModel, doctorId);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
