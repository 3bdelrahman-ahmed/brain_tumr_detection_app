import 'package:brain_tumr_detection_app/core/data/network_services/api_error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/local_services/cached_models/clinics_model.dart';
import '../model/get_chat_id_model/get_chat_id_model.dart';
import '../model/view_patient_response_model/view_patient_response_model.dart';
import '../remote/view_patients_data_source.dart';

@singleton
class ViewPatientsRepo {
  final ViewPatientsDataSource remoteDataSource;

  ViewPatientsRepo(this.remoteDataSource);

  Future<Either<ApiErrorModel, List<ViewPatientResponseModel>>> getPatients(
      clinicId, DateTime date) async {
    try {
      final response = await remoteDataSource.getPatients(clinicId, date);
      return Right(response);
    } catch (e) {
      print(e);
      return Left(ErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, GetChatIdModel>> getConversationId(
      String patientId) async {
    try {
      final response = await remoteDataSource.getConversationId(patientId);
      return Right(response);
    } catch (e) {
      print(e);
      return Left(ErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, List<Clinic>>> getDoctorClinics() async {
    try {
      final response = await remoteDataSource.getDoctorClinics();
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
