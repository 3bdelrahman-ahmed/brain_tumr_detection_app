import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/toast_string_extenstion.dart';
import 'package:brain_tumr_detection_app/features/view_patients/data/repo/view_patients_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../../../core/data/local_services/cached_models/clinics_model.dart';
import '../../../../../core/data/local_services/hive_caching_helper.dart';
import '../../../data/model/view_patient_response_model/view_patient_response_model.dart';

part 'view_patients_state.dart';

@injectable
class ViewPatientsCubit extends Cubit<ViewPatientsState> {
  final ViewPatientsRepo viewPatientsRepo;
  ViewPatientsCubit(this.viewPatientsRepo) : super(ViewPatientsInitial());
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 4));
  DateTime selectedDay = DateTime.now();
  List<ViewPatientResponseModel> patients = [];

  Future<void> getPatients(String clinicId, DateTime date) async {
    patients.clear();
    emit(ViewPatientsLoading());
    final result = await viewPatientsRepo.getPatients(clinicId, date);
    result.fold(
      (error) => emit(ViewPatientsError(error.message ?? '')),
      (patients) {
        this.patients = patients;
        emit(ViewPatientsLoaded(patients));
      },
    );
  }

  String formatDate() {
    return "${DateFormat('dd MMM yyyy').format(startDate)} -"
        " ${DateFormat('dd MMM yyyy').format(endDate)}";
  }

  void goToNext() {
    startDate = startDate.add(const Duration(days: 5));
    endDate = endDate.add(const Duration(days: 5));
    selectedDay = startDate;
    emit(ChangeDays(
      startDate,
      endDate,
      selectedDay,
    ));
  }

  void goToPrevious() {
    startDate = startDate.subtract(const Duration(days: 5));
    endDate = endDate.subtract(const Duration(days: 5));
    selectedDay = startDate;
    emit(ChangeDays(
      startDate,
      endDate,
      selectedDay,
    ));
  }

    void setSelectedClinic(Clinic? clinic) {
    selectedClinic = clinic;
    emit(SelectedClinicChanged());
  }

  void selectDay(DateTime day) {
    selectedDay = day;
    getPatients(
        selectedClinic?.id.toString() ?? '' ,
        DateTime(
          selectedDay.year,
          selectedDay.month,
          selectedDay.day,
        ));
    emit(SelectDay(day));
  }

  Future<int?> getConversationId(String patientId) async {
    emit(GetConversationIdLoading());
    final response = await viewPatientsRepo.getConversationId(patientId);
    return response.fold(
      (error) {
        emit(GetConversationIdError(error.message ?? ''));
        return null;
      },
      (conversationId) {
        final id = conversationId.id ?? 0;
        emit(GetConversationIdLoaded(id));
        return id;
      },
    );
  }

   Clinic? selectedClinic;
     List<Clinic> clinics = [];

      Future<void> getClinics() async {
    emit(GetClinicsLoading());
    final response = await viewPatientsRepo.getDoctorClinics();
    response.fold((l) {
      emit(GetClinicsError());
      l.message!.showToast();
    }, (r) {
      clinics = r;
      selectedClinic = clinics.isNotEmpty ? clinics[0] : null;
      HiveCachingHelper.saveClinics(clinics);
    });
    emit(GetClinicsSuccess());
  }

}
