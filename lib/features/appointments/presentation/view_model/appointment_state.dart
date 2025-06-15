part of 'appointment_cubit.dart';

@immutable
sealed class AppointmentState {}

final class AppointmentInitial extends AppointmentState {}

final class AppointmentLoading extends AppointmentState {}

final class AppointmentLoaded extends AppointmentState {}

final class AppointmentError extends AppointmentState {}
final class AppointmentCancelled extends AppointmentState {}


final class DeleteAppointmentLoadingState extends AppointmentState{}
final class DeleteAppointmentSuccessState extends AppointmentState{}
final class DeleteAppointmentErrorState extends AppointmentState{}


final class AddReviewLoadingState extends AppointmentState{}
final class AddReviewSuccessState extends AppointmentState{}
final class AddReviewErrorState extends AppointmentState{}

final class ReviewRatingChangedState extends AppointmentState {
  final int rating;

  ReviewRatingChangedState(this.rating);

  
}