import 'package:brain_tumr_detection_app/core/data/network_services/api_service.dart';
import 'package:brain_tumr_detection_app/features/reports/data/model/doctor_reports_model.dart';
import 'package:brain_tumr_detection_app/features/reports/data/model/view_report_model.dart';
import 'package:brain_tumr_detection_app/foundations/app_urls.dart';
import 'package:injectable/injectable.dart';

@singleton
class DoctorReportsRemoteDataSource {
  Future<DoctorReportsResponseModel> getDoctorReports(DoctorReportsRequestModel query) async {
    final response = await AppDio().get(path: AppUrls.assignedScans, queryParams: query.toJson());
    return DoctorReportsResponseModel.fromJson(response.data);
    
  }


  Future<ViewReportResponseModel> viewReport(ViewReportRequestModel body) async {
    final response = await AppDio().post(path: "${AppUrls.reviewScan}/${body.reportId}",data: body.toJson());
    return ViewReportResponseModel.fromJson(response.data);
  }
}
