import 'package:brain_tumr_detection_app/core/utils/extenstions/navigation_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/login/presentation/view/widgets/rember_me_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/components/widgets/custom_button.dart';
import '../../../../../../../core/components/widgets/custom_text_field.dart';
import '../../../../../../../core/config/app_routing.dart';
import '../../../../../../../core/utils/assets/assets_svg.dart';
import '../../../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../../../foundations/validations.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/login_cubit.dart';
import 'forgot_password_sheet.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var cubit = context.read<LoginCubit>();
      await cubit.checkBiometricAvailability();
      if (cubit.isBiometricAvailable) {
        await cubit.authenticateWithBiometrics();
      }
    });

    super.initState();
  }

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
                30.toHeight,
                CustomTextField(
                    label: S.of(context).password,
                    hintText: S.of(context).enterYourPassword,
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
                        fieldName: S.of(context).password,
                        fieldType: ValidationType.password)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RemberMeWidget(
                      remmberMeClicked: cubit.rememberMe,
                      onChanged: cubit.toggleRememberMe,
                    ),
                    TextButton(
                        style: ButtonStyle(
                          overlayColor: WidgetStateProperty.all(
                              Colors.transparent), // Removes tap effect
                          splashFactory:
                              NoSplash.splashFactory, // Disables ripple effect
                        ),
                        isSemanticButton: false,
                        onPressed: () {
                          final loginCubit = context.read<LoginCubit>();
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30.r)),
                            ),
                            builder: (context) => BlocProvider.value(
                              value: loginCubit,
                              child: ForgotPasswordSheet(),
                            ),
                          );
                        },
                        child: Text(
                          S.of(context).forgotPassword,
                          style: AppTextStyles.font15LightGreenW500,
                        )),
                  ],
                ),
                6.toHeight,
                RichText(
                    text: TextSpan(
                        text: S.of(context).dontHaveAnAccount,
                        style: AppTextStyles.font15LightGreenW500,
                        children: [
                      TextSpan(
                          text: S.of(context).signUp,
                          style: AppTextStyles.font15GreenW500,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.navigateTo(AppRoutes.registerScreen);
                            })
                    ])),
                24.toHeight,
                CustomButton(
                        isLoading: state is LoginLoadingState,
                        text: S.of(context).login,
                        raduis: 8.r,
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
