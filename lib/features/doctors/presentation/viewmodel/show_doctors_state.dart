part of 'show_doctors_cubit.dart';

@immutable
abstract class ShowDoctorsState {}

class ShowDoctorsInitial extends ShowDoctorsState {}

class ShowDoctorsLoading extends ShowDoctorsState {}

class ShowDoctorsLoaded extends ShowDoctorsState {}

class GetAvailableDoctorsSuccess extends ShowDoctorsState {
  final List<AvailableSlotsModel> slots;

  GetAvailableDoctorsSuccess(this.slots);
}

class GetAvailableDoctorsLoading extends ShowDoctorsState {}

class BookAppointmentSuccess extends ShowDoctorsState {
  final AvailablePatientSlotsResponseModel slot;

  BookAppointmentSuccess(this.slot);
}

class BookAppointmentPending extends ShowDoctorsState {}

class ShowDoctorsError extends ShowDoctorsState {
  final String message;

  ShowDoctorsError(this.message);
}
