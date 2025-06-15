part of 'slots_cubit.dart';

@immutable
sealed class SlotsState {}

final class SlotsInitial extends SlotsState {}

final class SlotsLoading extends SlotsState {}

final class SlotsLoaded extends SlotsState {}

final class SlotsError extends SlotsState {}

final class SlotsGetClinics extends SlotsState {}

final class SlotsChangeDays extends SlotsState {}

final class GetClinicsLoading extends SlotsState {}

final class GetClinicsSuccess extends SlotsState {}

final class GetClinicsError extends SlotsState {}

final class GetCachedClinics extends SlotsState {}

final class SelectedDayIndexChanged extends SlotsState {}

class SlotsRemoveLoading extends SlotsState {}

class SlotsSelectDay extends SlotsState {}

class SlotsListAdded extends SlotsState {}

class SlotsListRemoved extends SlotsState {}

class SlotsListUpdated extends SlotsState {}

class SlotsUndoRemoved extends SlotsState {}

class SelectedClinicChanged extends SlotsState {}

class SlotsChangedState extends SlotsState {
  final bool hasChanges;
  SlotsChangedState({required this.hasChanges});
}

class AddSlotLoadingState extends SlotsState {}

class AddSlotSuccessState extends SlotsState {}

class AddSlotErrorState extends SlotsState {}
