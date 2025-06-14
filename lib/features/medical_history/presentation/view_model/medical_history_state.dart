part of 'medical_history_cubit.dart';

@immutable
sealed class MedicalHistoryState {}

final class MedicalHistoryInitial extends MedicalHistoryState {}

final class MedicalHistoryLoading extends MedicalHistoryState {}

final class GetDoctorByIdLoading extends MedicalHistoryState {}
final class GetDoctorByIdLoaded extends MedicalHistoryState {
  final DoctorClinicModel doctorClinicModel;

  GetDoctorByIdLoaded({required this.doctorClinicModel});
}

final class GetDoctorByIdError extends MedicalHistoryState {}

final class MedicalHistoryLoaded extends MedicalHistoryState {}

final class MedicalHistoryError extends MedicalHistoryState {}
