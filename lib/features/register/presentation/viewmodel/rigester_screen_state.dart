part of 'rigester_screen_cubit.dart';

@immutable
sealed class RigesterScreenState{}

final class RigesterScreenInitial extends RigesterScreenState {}

final class RigesterScreenChangeForm extends RigesterScreenState {}

final class RigesterScreenUpdateScreen extends RigesterScreenState {}


