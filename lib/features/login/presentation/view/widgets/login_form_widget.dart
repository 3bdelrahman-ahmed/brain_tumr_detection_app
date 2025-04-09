import 'package:brain_tumr_detection_app/core/utils/extenstions/navigation_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/components/widgets/custom_button.dart';
import '../../../../../../../core/components/widgets/custom_text_field.dart';
import '../../../../../../../core/config/app_routing.dart';
import '../../../../../../../core/utils/assets/assets_svg.dart';
import '../../../../../../../core/utils/string/app_string.dart';
import '../../../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../../../foundations/validations.dart';
import '../../view_model/login_cubit.dart';
import 'forgot_password_sheet.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    return Form(
        key: cubit.formKey,
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return Column(
              children: [
                CustomTextField(
                    focusNode: cubit.emailFocusNode,
                    label: AppStrings.email,
                    hintText: AppStrings.enterYourEmail,
                    controller: cubit.emailController,
                    onSubmit: (value) {
                      FocusScope.of(context)
                          .requestFocus(cubit.passwordFocusNode);
                    },
                    validator: (value) => checkFieldValidation(
                        val: cubit.emailController.text,
                        fieldName: AppStrings.email,
                        fieldType: ValidationType.email)),
                30.toHeight,
                CustomTextField(
                    label: AppStrings.password,
                    hintText: AppStrings.enterYourPassword,
                    controller: cubit.passwordController,
                    obscureText: cubit.isObscure,
                    suffixIcon: AssetsSvg.password,
                    onSuffixTap: () {
                      cubit.changePassword();
                    },
                    focusNode: cubit.passwordFocusNode,
                    onSubmit: (p0) {
                      cubit.login();
                    },
                    validator: (value) => checkFieldValidation(
                        val: cubit.passwordController.text,
                        fieldName: AppStrings.password,
                        fieldType: ValidationType.password)),
                TextButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.all(
                          Colors.transparent), // Removes tap effect
                      splashFactory:
                          NoSplash.splashFactory, // Disables ripple effect
                    ),
                    isSemanticButton: false,
                    onPressed: () => showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30.r)),
                          ),
                          builder: (_) => ForgotPasswordSheet(),
                        ),
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        AppStrings.forgotPassword,
                        style: AppTextStyles.font15LightGreenW500,
                      ),
                    )),
                8.toHeight,
                RichText(
                    text: TextSpan(
                        text: AppStrings.dontHaveAnAccount,
                        style: AppTextStyles.font15LightGreenW500,
                        children: [
                      TextSpan(
                          text: AppStrings.signUp,
                          style: AppTextStyles.font15GreenW500,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.navigateTo(AppRoutes.registerScreen);
                            })
                    ])),
                24.toHeight,
                CustomButton(
                    isLoading: state is LoginLoadingState,
                    text: AppStrings.login,
                    onTap: () {
                      cubit.login();
                    }).animate().flipV(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
          )
              ],
            );
          },
        ));
  }
}
