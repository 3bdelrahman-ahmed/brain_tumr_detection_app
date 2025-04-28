import 'package:brain_tumr_detection_app/core/data/network_services/api_service.dart';
import 'package:brain_tumr_detection_app/features/doctors/data/models/get_reviews_request_model.dart';
import 'package:brain_tumr_detection_app/features/doctors/data/models/get_reviews_response_model.dart';
import 'package:brain_tumr_detection_app/foundations/app_urls.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReviewsDataSource {
  Future<GetReviewsResponse> getDoctorReviews(
      GetReviewsRequestModel getReviewRequestModel, int DoctorId) async {
    final response = await AppDio().get(
        path: "${AppUrls.getDoctorReview}${DoctorId}",
        queryParams: getReviewRequestModel.toJson());

    return GetReviewsResponse.fromJson(response.data);
  }
}
