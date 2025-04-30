part of 'show_doctors_cubit.dart';

@immutable
abstract class ShowDoctorsState {}

class ShowDoctorsInitial extends ShowDoctorsState {}

class ShowDoctorsLoading extends ShowDoctorsState {}

class ShowDoctorsLoaded extends ShowDoctorsState {}

class ShowDoctorsError extends ShowDoctorsState {
  final String message;

  ShowDoctorsError(this.message);
}
