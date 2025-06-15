import 'package:brain_tumr_detection_app/core/data/network_services/api_service.dart';
import 'package:brain_tumr_detection_app/foundations/app_urls.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/local_services/cached_models/clinics_model.dart';
import '../model/add_slot_model.dart';
import '../model/available_slots.dart';

@singleton
class ClinicsRemoteDataSource {
  Future<List<Clinic>> getDoctorClinics() async {
    final response = await AppDio().get(path: AppUrls.getDoctorClinics);
    final List<dynamic> clinicsJson = response.data;
    return clinicsJson.map((json) => Clinic.fromJson(json)).toList();
  }

  Future<List<AvailableSlotsModel>> getAvailableSlots(
      AvailableSlotsRequestModel query) async {
    final response = await AppDio().get(
        path:
            "${AppUrls.getClinicSlots}/${query.clinicId}/slots?day=${query.day}");
    final List<dynamic> slotsJson = response.data;
    return slotsJson.map((json) => AvailableSlotsModel.fromJson(json)).toList();
  }

  Future<AddSlotResponseModel> addSlot(AddSlotRequestModel body) async {
    final response = await AppDio().post(path: AppUrls.addSlot, data: body);
    return AddSlotResponseModel.fromJson(response.data);
  }

  Future<String> deleteSlot(int slotId) async {
    final response =
        await AppDio().delete(path: "${AppUrls.deleteSlot}$slotId");
    return response.data;
  }

  Future<String> edit(int slotId, String startTime) async {
    final response = await AppDio().put(
        path: "${AppUrls.editSlot}$slotId", data: {"startTime": startTime});
    return response.data;
  }
}
