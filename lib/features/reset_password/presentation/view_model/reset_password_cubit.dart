import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/core/config/app_routing.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/toast_string_extenstion.dart';
import 'package:brain_tumr_detection_app/features/reset_password/data/model/reset_password_request_model.dart';
import 'package:brain_tumr_detection_app/features/reset_password/data/repo/reset_password_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/extenstions/navigation_extenstions.dart';

part 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.repository) : super(ResetPasswordInitial());
  final ResetPasswordRepository repository;
  final formKey = GlobalKey<FormState>();
  BuildContext context = NavigationExtensions.navigatorKey.currentContext!;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final otpController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  final otpFocusNode = FocusNode();
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

  Future<void> submitNewPassword() async {
    if (formKey.currentState!.validate()) {
      emit(ResetPasswordLoadingState());
      final response = await repository.resetPassword(ResetPasswordRequestModel(
          email: emailController.text,
          token: otpController.text,
          password: passwordController.text));
      return response.fold(
        (l) {
          l.message!.showToast();
          emit(ResetPasswordError());
        },
        (r) {
          r.showToast();
          context.navigateTo(AppRoutes.loginScreen);
        },
      );
    }
  }
}
