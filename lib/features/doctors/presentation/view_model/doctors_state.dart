part of 'doctors_cubit.dart';

@immutable
abstract class DoctorsState {}

class ShowDoctorsInitial extends DoctorsState {}

class ShowDoctorsLoading extends DoctorsState {}

class ShowDoctorsLoaded extends DoctorsState {}

class GetAvailableDoctorsSuccess extends DoctorsState {
  final List<AvailableSlotsModel> slots;

  GetAvailableDoctorsSuccess(this.slots);
}

class GetAvailableDoctorsLoading extends DoctorsState {}

class BookAppointmentSuccess extends DoctorsState {
  final AvailablePatientSlotsResponseModel slot;

  BookAppointmentSuccess(this.slot);
}

class BookAppointmentPending extends DoctorsState {}

class ShowDoctorsError extends DoctorsState {
  final String message;

  ShowDoctorsError(this.message);
}
