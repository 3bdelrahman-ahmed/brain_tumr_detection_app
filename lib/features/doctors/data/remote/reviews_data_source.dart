import 'package:brain_tumr_detection_app/core/data/network_services/api_service.dart';
import 'package:brain_tumr_detection_app/features/doctors/data/models/get_reviews_request_model.dart';
import 'package:brain_tumr_detection_app/features/doctors/data/models/get_reviews_response_model.dart';
import 'package:brain_tumr_detection_app/features/slots/data/model/available_slots.dart';
import 'package:brain_tumr_detection_app/foundations/app_urls.dart';
import 'package:injectable/injectable.dart';

import '../models/get_slots.dart';

@injectable
class DoctorAppointmentDataSource {
  Future<GetReviewsResponse> getDoctorReviews(
      GetReviewsRequestModel getReviewRequestModel, int DoctorId) async {
    final response = await AppDio().get(
        path: "${AppUrls.getDoctorReview}${DoctorId}",
        queryParams: getReviewRequestModel.toJson());

    return GetReviewsResponse.fromJson(response.data);
  }

  Future<List<AvailableSlotsModel>> getDoctorAvailableSlots(
      AvailablePatientSlotsRequestModel request) async {
    final response = await AppDio().get(
        path:
            "${AppUrls.getAvailableSlots}/${request.slotId}?Date=${request.date}");
    final List<dynamic> slotsJson = response.data;
    return slotsJson.map((json) => AvailableSlotsModel.fromJson(json)).toList();
  }

  Future<AvailablePatientSlotsResponseModel> bookAppointment(
      AvailablePatientSlotsRequestModel request) async {
    final response =
        await AppDio().post(path: AppUrls.bookAppointment, data: request);
    return AvailablePatientSlotsResponseModel.fromJson(response.data);
  }
}
