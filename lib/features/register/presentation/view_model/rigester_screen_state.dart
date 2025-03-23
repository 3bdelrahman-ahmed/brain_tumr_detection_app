part of 'rigester_screen_cubit.dart';

@immutable
sealed class RigesterScreenState{}

final class RigesterScreenInitial extends RigesterScreenState {}

final class RigesterScreenChangeForm extends RigesterScreenState {}

final class RigesterScreenUpdateScreen extends RigesterScreenState {}

final class RigesterScreenLoadingState extends RigesterScreenState {}

final class RigesterScreenErrorState extends RigesterScreenState {}

final class RigesterScreenSuccessState extends RigesterScreenState {}

final class ClearAuthFieldsState extends RigesterScreenState {}



