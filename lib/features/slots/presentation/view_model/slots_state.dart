part of 'slots_cubit.dart';

@immutable
sealed class SlotsState {}

final class SlotsInitial extends SlotsState {}
final class SlotsLoading extends SlotsState {}
final class SlotsGetClinics extends SlotsState {}
final class SlotsChangeDays extends SlotsState {}
class SlotsRemoveDay extends SlotsState {}
class SlotsSelectDay extends SlotsState {}
class SlotsListAdded extends SlotsState {}
class SlotsListRemoved extends SlotsState {}
class SlotsListUpdated extends SlotsState {}
class SlotsUndoRemoved extends SlotsState {}
class SelectedClinicChanged extends SlotsState {}

