part of 'login_cubit.dart';

@immutable
sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class ChangePasswordState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {}

final class LoginErrorState extends LoginState {}

final class ChangeRememberMeState extends LoginState {
  final bool rememberMe;
  const ChangeRememberMeState({required this.rememberMe});
  @override
  List<Object> get props => [rememberMe];
}

class BiometricAvailabilityState extends LoginState {
  final bool isBiometricAvailable;
  const BiometricAvailabilityState({required this.isBiometricAvailable});
  @override
  List<Object> get props => [isBiometricAvailable];
}
