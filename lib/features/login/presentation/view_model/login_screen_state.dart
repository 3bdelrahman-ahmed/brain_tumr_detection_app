part of 'login_screen_cubit.dart';

@immutable
sealed class LoginScreenState {}

final class LoginScreenInitial extends LoginScreenState {}

final class ShowForgotPasswordState extends LoginScreenState {}


final class LoginLoadingState extends LoginScreenState {}

final class LoginSuccessState extends LoginScreenState {}

final class LoginErrorState extends LoginScreenState {}
