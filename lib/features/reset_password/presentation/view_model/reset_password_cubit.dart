import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';
@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  final  formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  bool isObscure = true;
  bool isConfirmObscure = true;
  void changeVisiblePassword() {
    isObscure = !isObscure;
    emit(ResetPasswordChangeVisibilty(isObscure));
  }

  void changeVisibleConfirmPassword() {
    isConfirmObscure = !isConfirmObscure;
    emit(ResetPasswordChangeVisibilty(isConfirmObscure));
  }

}
