import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/navigation_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/toast_string_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/app_routing.dart';
import '../../data/repo/settings_repository.dart';

part 'settings_state.dart';

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository repository;
  SettingsCubit({required this.repository}) : super(SettingsInitial());

    final forgetPasswordController = TextEditingController();
      final forgetPasswordFormKey = GlobalKey<FormState>();

 Future<void> forgetPassword(BuildContext context) async {
    if (forgetPasswordFormKey.currentState!.validate()) {
      emit(ForgetPasswordLoadingState());
      final response =
          await repository.forgetPassword(forgetPasswordController.text);
      response.fold((l) {
        l.message!.showToast();
        emit(ForgetPasswordErrorState());
      }, (r) {
        context.navigateTo(
          AppRoutes.verificationCodeScreen,
          arguments: {
            'email': r,
            'isResetPass': true,
          },
        );
        emit(ForgetPasswordSuccessState());
      });
    }
  }
}
