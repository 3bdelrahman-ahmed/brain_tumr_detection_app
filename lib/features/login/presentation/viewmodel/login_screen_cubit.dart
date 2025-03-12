import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'login_screen_state.dart';
@injectable
class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit() : super(LoginScreenInitial());
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void login(){
    if (formKey.currentState!.validate()) {
      print("Form is valid! Proceed with registration...");
      close();
    } else {
      print("Form is not valid");
    }
  }
  void showForgotPassword() {
    emit(ShowForgotPasswordState()); // Notify UI to show the bottom sheet
  }
}
