part of 'verification_code_cubit.dart';

sealed class VerificationCodeState extends Equatable {
  const VerificationCodeState();

  @override
  List<Object> get props => [];
}

final class VerificationCodeInitial extends VerificationCodeState {}

final class SubmitVerificationCodeLoadingState extends VerificationCodeState {}

final class SubmitVerificationCodeSuccessState extends VerificationCodeState {}

final class SubmitVerificationCodeErrorState extends VerificationCodeState {}
