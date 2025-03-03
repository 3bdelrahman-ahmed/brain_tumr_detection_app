part of 'rigester_screen_cubit.dart';

@immutable
sealed class RigesterScreenState {}

final class RigesterScreenInitial extends RigesterScreenState {}

final class RigesterScreenChangePage extends RigesterScreenState {}
