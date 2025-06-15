import 'package:brain_tumr_detection_app/core/data/network_services/api_error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../model/doctor_reports_model.dart';
import '../model/view_report_model.dart';
import '../remote/doctor_reports_remote_data_source.dart';

@singleton
class DoctorReportsRepository {
  final DoctorReportsRemoteDataSource remoteDataSource;
  DoctorReportsRepository({required this.remoteDataSource});

  Future<Either<ApiErrorModel, DoctorReportsResponseModel>>
      getDoctorReports(DoctorReportsRequestModel query) async {
    try {
      final response = await remoteDataSource.getDoctorReports(query);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, ViewReportResponseModel>>
      viewReport(ViewReportRequestModel body) async {
    try {
      final response = await remoteDataSource.viewReport(body);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
