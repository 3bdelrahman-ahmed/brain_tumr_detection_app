part of 'appointment_cubit.dart';

@immutable
sealed class AppointmentState {}

final class AppointmentInitial extends AppointmentState {}
final class AppointmentLoading extends AppointmentState {}
final class GetAppointmentsSuccess extends AppointmentState {}
final class GetAppointmentsFailed extends AppointmentState {}
