import 'package:brain_tumr_detection_app/core/data/network_services/api_error_handler.dart';
import 'package:brain_tumr_detection_app/features/scan/data/models/upload_scan_model.dart';
import 'package:brain_tumr_detection_app/features/scan/data/remote/upload_scan_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@singleton
class UploadScanRepotitory {
  final UploadScanRemoteDataSource  uploadScanRemoteDataSource;
  UploadScanRepotitory({required this.uploadScanRemoteDataSource});

  Future<Either<ApiErrorModel,UploadScanResponseModel>> uploadScan (UploadScanRequestModel body) async {
    try {
      final response = await uploadScanRemoteDataSource.uploadScan(body);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}