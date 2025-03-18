import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/toast_string_extenstion.dart';
import 'package:brain_tumr_detection_app/features/login/data/models/login_model.dart';
import 'package:brain_tumr_detection_app/features/login/data/repository/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'login_screen_state.dart';
@injectable
class LoginScreenCubit extends Cubit<LoginScreenState> {
  final LoginRepository repository;
  LoginScreenCubit({required this.repository}) : super(LoginScreenInitial());
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> login() async {
    if(formKey.currentState!.validate()){
 emit(LoginLoadingState());

  final result = await repository.login(
    LoginRequestModel(
      email: emailController.text, 
      password: passwordController.text
    ),
  );

  result.fold((l) {
    l.message!.showToast();
    emit(LoginErrorState());
  }, (r) async {
   
    // AppCacheHelper.cacheString(
    //     key: AppCacheHelper.rememberMe, value: rememberMe);
    // AppConst.setToken(r.token!);
    // AppConst.setUser(r.user!);
    // AppConst.user = r.user;

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
