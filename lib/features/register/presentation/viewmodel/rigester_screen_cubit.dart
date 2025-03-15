import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'rigester_screen_state.dart';
@injectable
class RigesterScreenCubit extends Cubit<RigesterScreenState> {
  RigesterScreenCubit() : super(RigesterScreenInitial());
  final formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
   int? currentIndex = 0;
  void register(){
    if (formKey.currentState!.validate()) {
      print("Form is valid! Proceed with registration...");
      close();
    } else {
      print("Form is not valid");
    }
  }
   void changeForm(int? index){
     currentIndex = index;
    emit(RigesterScreenChangeForm());
   }
  @override
  Future<void> close() {
    fullNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
