part of 'rigester_screen_cubit.dart';

@immutable
sealed class RigesterScreenState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class RigesterScreenInitial extends RigesterScreenState {}

final class RigesterScreenChangeForm extends RigesterScreenState {}
