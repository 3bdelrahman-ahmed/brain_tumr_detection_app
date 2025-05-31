part of 'view_patients_cubit.dart';

sealed class ViewPatientsState extends Equatable {
  const ViewPatientsState();

  @override
  List<Object> get props => [];
}

final class ViewPatientsInitial extends ViewPatientsState {}

final class ViewPatientsLoading extends ViewPatientsState {}

final class ViewPatientsLoaded extends ViewPatientsState {
  final List<ViewPatientResponseModel> patients;

  const ViewPatientsLoaded(this.patients);

  @override
  List<Object> get props => [patients];
}

final class ViewPatientsError extends ViewPatientsState {
  final String error;

  const ViewPatientsError(this.error);

  @override
  List<Object> get props => [error];
}

final class ChangeDays extends ViewPatientsState {
  final DateTime startDate;
  final DateTime endDate;
  final DateTime selectedDay;
  const ChangeDays(this.startDate, this.endDate, this.selectedDay);
  @override
  List<Object> get props => [
        startDate,
        endDate,
        selectedDay,
      ];
}

final class SelectDay extends ViewPatientsState {
  final DateTime day;

  const SelectDay(this.day);

  @override
  List<Object> get props => [day];
}

final class GetConversationIdLoading extends ViewPatientsState {
  const GetConversationIdLoading();

  @override
  List<Object> get props => [];
}

final class GetConversationIdLoaded extends ViewPatientsState {
  final int conversationId;

  const GetConversationIdLoaded(this.conversationId);

  @override
  List<Object> get props => [conversationId];
}

final class GetConversationIdError extends ViewPatientsState {
  final String error;

  const GetConversationIdError(this.error);

  @override
  List<Object> get props => [error];
}
