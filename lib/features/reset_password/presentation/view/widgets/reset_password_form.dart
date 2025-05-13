import 'package:brain_tumr_detection_app/core/components/screens/register_screen_location_widget.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/reset_password/presentation/view_model/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/widgets/custom_button.dart';
import '../../../../../core/components/widgets/custom_text_field.dart';
import '../../../../../core/utils/assets/assets_svg.dart';
import '../../../../../foundations/validations.dart';
import '../../../../../generated/l10n.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResetPasswordCubit>();
    return Form(
        key: cubit.formKey,
        child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
          builder: (context, state) {
            return Column(
              children: [
                CustomTextField(
                    label: S.of(context).email,
                    hintText: S.of(context).enterYourEmail,
                    controller: cubit.emailController,
                    onSubmit: (value) {
                      FocusScope.of(context)
                          .requestFocus(cubit.passwordFocusNode);
                    },
                    validator: (value) => checkFieldValidation(
                        val: cubit.emailController.text,
                        fieldName: S.of(context).email,
                        fieldType: ValidationType.email)),
                10.toHeight,
                CustomTextField(
                    label: S.of(context).password,
                    hintText: S.of(context).enterYourPassword,
                    controller: cubit.passwordController,
                    obscureText: cubit.isObscure,
                    suffixIcon: AssetsSvg.password,
                    onSuffixTap: () {
                      cubit.changeVisiblePassword();
                    },
                    focusNode: cubit.passwordFocusNode,
                    onSubmit: (p0) {
                      FocusScope.of(context)
                          .requestFocus(cubit.confirmPasswordFocusNode);
                    },
                    validator: (value) => checkFieldValidation(
                        val: cubit.passwordController.text,
                        fieldName: S.of(context).password,
                        fieldType: ValidationType.password)),
                10.toHeight,
                CustomTextField(
                    label: S.of(context).confirmPassword,
                    hintText: S.of(context).enterYourPassword,
                    controller: cubit.confirmPasswordController,
                    obscureText: cubit.isConfirmObscure,
                    suffixIcon: AssetsSvg.password,
                    onSuffixTap: () {
                      cubit.changeVisibleConfirmPassword();
                    },
                    focusNode: cubit.confirmPasswordFocusNode,
                    onSubmit: (p0) {},
                    validator: (value) => checkFieldValidation(
                        val: cubit.passwordController.text,
                        fieldName: S.of(context).password,
                        fieldType: ValidationType.password)),
                25.toHeight,
                CustomButton(
                        isLoading: state is ResetPasswordLoadingState,
                        text: S.of(context).resetPassword,
                        onTap: () {})
                    .animate()
                    .flipV(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    )
              ],
            );
          },
        ));
  }
}
