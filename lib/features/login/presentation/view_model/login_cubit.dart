import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/core/config/app_routing.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/toast_string_extenstion.dart';
import 'package:brain_tumr_detection_app/features/login/data/models/login_model.dart';
import 'package:brain_tumr_detection_app/features/login/data/repository/login_repository.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/local_services/app_caching_helper.dart';
import '../../../../core/utils/extenstions/navigation_extenstions.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginRepository repository;

  LoginCubit({required this.repository}) : super(LoginInitial());
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  BuildContext context = NavigationExtensions.navigatorKey.currentContext!;

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());

      final result = await repository.login(
        LoginRequestModel(
            email: emailController.text, password: passwordController.text),
      );

      result.fold((l) {
        l.message!.showToast();
        emit(LoginErrorState());
      }, (r) async {
        // AppCacheHelper.cacheString(
        //     key: AppCacheHelper.rememberMe, value: rememberMe);
        await AppConstants.setToken(r.token!);
        context.navigateTo(AppRoutes.homeScreen);
        AppConstants.setUser(r.user!);
        AppConstants.user = r.user;

        // // Navigate based on role
        // if (AppConst.user!.role == UserRoles.envoy.name) {
        //   Navigator.pushNamedAndRemoveUntil(
        //       context, AppRouting.previewRequestsResultsScreen, (_) => false);
        // } else {
        //   Navigator.pushNamedAndRemoveUntil(
        //       context, AppRouting.homeScreen, (_) => false);
        // }
        emit(LoginSuccessState());
      });
    }
  }

  void showForgotPassword() {
    emit(ShowForgotPasswordState()); // Notify UI to show the bottom sheet
  }
}
