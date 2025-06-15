part of 'clinics_management_cubit.dart';

sealed class ClinicsManagementState extends Equatable {
  const ClinicsManagementState();

  @override
  List<Object> get props => [];
}

final class ClinicsManagementInitial extends ClinicsManagementState {}


final class SetClinicLiscenseState extends ClinicsManagementState {
 
}

final class SetClinicLocationState extends ClinicsManagementState{}

final class AddClinicLoadingState extends ClinicsManagementState {}
final class AddClinicSuccessState extends ClinicsManagementState {}
final class AddClinicErrorState extends ClinicsManagementState {

}
