import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/toast_string_extenstion.dart';
import 'package:brain_tumr_detection_app/features/reports/data/model/doctor_reports_model.dart';
import 'package:brain_tumr_detection_app/features/reports/data/repo/doctor_reports_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../data/model/view_report_model.dart';
part 'reports_state.dart';

@injectable
class ReportsCubit extends Cubit<ReportsState> {
  final DoctorReportsRepository repository;
  ReportsCubit({required this.repository}) : super(ReportsInitial()) {}

  DoctorReportsResponseModel? reports;
  int pageIndex = 1;

  final ScrollController scrollController = ScrollController();
  bool isLoadingMore = false;

  Future<void> getAssignedScans() async {
    emit(GetAssignedScansLoading());
    final result = await repository.getDoctorReports(
      DoctorReportsRequestModel(
        pageIndex: pageIndex,
        pageSize: 10,
      ),
    );
    result.fold(
      (error) {
        emit(GetAssignedScansFailure());
      },
      (response) {
        print("Reports: ${response.reports!.length}");
        reports = response;
        emit(GetAssignedScansSuccess());
      },
    );
  }

  Future<void> loadMoreReports() async {
    if (pageIndex >= (reports?.totalPages ?? 1)) return;
    pageIndex++;
    isLoadingMore = true;
    final result = await repository.getDoctorReports(
      DoctorReportsRequestModel(
        pageIndex: pageIndex,
        pageSize: 10,
      ),
    );
    result.fold(
      (error) {
        isLoadingMore = false;
        emit(GetAssignedScansFailure());
      },
      (response) {
        if (response.reports!.isEmpty) {
          pageIndex--;
          isLoadingMore = false;
          emit(GetAssignedScansSuccess());

          return;
        }
        reports?.reports?.addAll(response.reports ?? []);
        isLoadingMore = false;

        emit(GetAssignedScansSuccess());
      },
    );
  }

  TextEditingController findingsController = TextEditingController();
  TextEditingController reasoningController = TextEditingController();
  TextEditingController tumortypeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final dialogFormKey = GlobalKey<FormState>();
  void onViewReport(int index) {
    // reports[index].isViewed = !reports[index].isViewed;
    emit(ReportsViewReport());
  }

  Future<void> viewReport(Report reportId, BuildContext context) async {
    emit(ViewReportLoading());
    final result = await repository.viewReport(
      ViewReportRequestModel(
        reportId: reportId.id!,
        detectionClass: tumortypeController.text.isNotEmpty
            ? tumortypeController.text
            : reportId.detectionClass!,
        findings: findingsController.text,
        reasonings: reasoningController.text,
      ),
    );
    result.fold(
      (error) {
        error.message!.showToast();
        emit(ViewReportFailure());
      },
      (response) {
        // make is vired true

        Navigator.of(context).pop();
        response.message!.showToast();
        emit(ViewReportSuccess());
      },
    );
  }

  void resetControllers() {
    findingsController.clear();
    reasoningController.clear();
    tumortypeController.clear();
  }
}
