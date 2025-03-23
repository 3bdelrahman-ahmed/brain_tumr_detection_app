import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/core/config/app_routing.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/toast_string_extenstion.dart';
import 'package:brain_tumr_detection_app/core/utils/string/app_string.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/utils/extenstions/navigation_extenstions.dart';
import '../../../data/models/verification_code_model.dart';
import '../../../data/repository/verify_code_repository.dart';

part 'verification_code_state.dart';

@injectable
class VerificationCodeCubit extends Cubit<VerificationCodeState> {
  final VerifyCodeRepository repository;
  VerificationCodeCubit({required this.repository})
      : super(VerificationCodeInitial());

  List<String> code = List.filled(6, "*");
  BuildContext context = NavigationExtensions.navigatorKey.currentContext!;
  final formKey = GlobalKey<FormState>();

  Future<void> verifyCode(String email) async {
    emit(SubmitVerificationCodeLoadingState());
    final response = await repository.verifyCode(VerificationCodeRequestModel(
        email:email, code: code.join()));
    response.fold(
      (l) {
        l.message!.showToast();
        emit(SubmitVerificationCodeErrorState());
      },
      (r){
        AppStrings.sucessOpertation.showToast();
        context.navigateTo(AppRoutes.loginScreen);
        emit(SubmitVerificationCodeSuccessState());
      },
    );
  }
}
