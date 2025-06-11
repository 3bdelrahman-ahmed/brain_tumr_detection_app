import 'package:brain_tumr_detection_app/core/data/network_services/api_error_handler.dart';
import 'package:brain_tumr_detection_app/features/slots/data/remote/clinics_remote_ds.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/local_services/cached_models/clinics_model.dart';
import '../model/add_slot_model.dart';
import '../model/available_slots.dart';

@singleton
class ClinicsRepository {
  ClinicsRemoteDataSource clinicsRemoteDataSource;
  ClinicsRepository({required this.clinicsRemoteDataSource});
  Future<Either<ApiErrorModel, List<Clinic>>> getDoctorClinics() async {
    try {
      final response = await clinicsRemoteDataSource.getDoctorClinics();
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, List<AvailableSlotsModel>>> getAvailabelSlots(
      AvailableSlotsRequestModel query) async {
    try {
      final response = await clinicsRemoteDataSource.getAvailableSlots(query);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, AddSlotResponseModel>> addSlot(
      AddSlotRequestModel body) async {
    try {
      final response = await clinicsRemoteDataSource.addSlot(body);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, String>> deleteSlot(
      int slotId) async {
    try {
      final response = await clinicsRemoteDataSource.deleteSlot(slotId);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, String>> editSlot(
      int slotId ,String startTime) async {
    try {
      final response = await clinicsRemoteDataSource.edit(slotId,startTime);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
