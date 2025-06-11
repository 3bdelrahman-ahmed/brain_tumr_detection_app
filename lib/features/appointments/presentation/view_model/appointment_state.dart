part of 'appointment_cubit.dart';

@immutable
sealed class AppointmentState {}

final class AppointmentInitial extends AppointmentState {}

final class AppointmentLoading extends AppointmentState {}

final class AppointmentLoaded extends AppointmentState {}

final class AppointmentError extends AppointmentState {}
final class AppointmentCancelled extends AppointmentState {}
