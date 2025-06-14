import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/core/data/models/doctor_clinic_model.dart';
import 'package:brain_tumr_detection_app/features/medical_history/data/model/detection_response.dart';
import 'package:brain_tumr_detection_app/features/medical_history/data/repository/medical_history_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'medical_history_state.dart';

@injectable
class MedicalHistoryCubit extends Cubit<MedicalHistoryState> {
  final MedicalHistoryRepository medicalHistoryRepository;

  MedicalHistoryCubit({required this.medicalHistoryRepository})
      : super(MedicalHistoryInitial());
  DetectionResponse? detectionResponse;
  int pageSize = 10;
  int pageIndex = 1;
  bool isLoadingMore = false;
  final ScrollController scrollController = ScrollController();

  Future<void> getPatientScans() async {
    emit(MedicalHistoryLoading());
    final response = await medicalHistoryRepository.getPatientScans(
      DetectionRequest(
        pageIndex: pageIndex,
        pageSize: pageSize,
      ),
    );
    response.fold(
      (error) => emit(MedicalHistoryError()),
      (data) {
        detectionResponse = data;
        pageIndex = data.pageIndex;
        emit(MedicalHistoryLoaded());
      },
    );
  }

  Future<void> getDoctorById(String DoctorId) async {
    emit(GetDoctorByIdLoading());
    final response = await medicalHistoryRepository.getDoctorById(DoctorId);
    response.fold(
      (error) => emit(GetDoctorByIdError()),
      (data) {
        emit(GetDoctorByIdLoaded(doctorClinicModel: data));
      },
    );
  }

  Future<void> loadMoreScans() async {
    if (isLoadingMore) return;
    isLoadingMore = true;
    pageIndex++;
    final response = await medicalHistoryRepository.getPatientScans(
      DetectionRequest(
        pageIndex: pageIndex,
        pageSize: pageSize,
      ),
    );
    response.fold(
      (error) {
        isLoadingMore = false;
        emit(MedicalHistoryError());
      },
      (data) {
        detectionResponse?.data.addAll(data.data);
        // Prevent duplicate page increase on empty response
        if (data.data.isEmpty) {
          pageIndex = pageIndex - 1;
        }
        isLoadingMore = false;
        emit(MedicalHistoryLoaded());
      },
    );
  }
}
