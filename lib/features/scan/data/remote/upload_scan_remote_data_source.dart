import 'package:brain_tumr_detection_app/features/scan/data/models/upload_scan_model.dart';
import 'package:brain_tumr_detection_app/foundations/app_urls.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/network_services/api_service.dart';
@singleton
class UploadScanRemoteDataSource {
  Future<UploadScanResponseModel> uploadScan(
      UploadScanRequestModel requestModel) async {
    final response = await AppDio().post(path: AppUrls.cancerPrediction,
        data: await requestModel.toFormData());

    return UploadScanResponseModel.fromJson(response.data);
  }
}