import 'package:brain_tumr_detection_app/core/config/app_routing.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/navigation_extenstions.dart';
import 'package:brain_tumr_detection_app/foundations/validations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_png.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/string/app_string.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/login/presentation/view_model/login_cubit.dart';
import '../../../../../core/components/widgets/custom_text_field.dart';
import 'forgot_password_sheet.dart';

class LoginScreenWidget extends StatelessWidget {
  const LoginScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is ShowForgotPasswordState) {
          showModalBottomSheet(
            // showDragHandle: true,

            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
            ),
            builder: (_) => ForgotPasswordSheet(),
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: AssetsPng.loginScreen.toPng(),
            height: 350.h,
            width: double.infinity,
          ),
          15.toHeight,
          Text(
            AppStrings.login,
            style: AppTextStyles.font20GreenW500,
          ),
          8.toHeight,
          Text(
            AppStrings.heyThereLogin,
            style: AppTextStyles.font15LightGreenW500,
            textAlign: TextAlign.center,
          ).paddingSymmetric(horizontal: 10.w),
          10.toHeight,
          Form(
              key: cubit.formKey,
              child: Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
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
                            obscureText: true,
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
                              splashFactory: NoSplash
                                  .splashFactory, // Disables ripple effect
                            ),
                            isSemanticButton: false,
                            onPressed: () => cubit.showForgotPassword(),
                            child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: Text(
                                AppStrings.forgotPassword,
                                style: AppTextStyles.font15LightGreenW500,
                              ),
                            )),
                        6.toHeight,
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
                                      context
                                          .navigateTo(AppRoutes.registerScreen);
                                    })
                            ])),
                        32.toHeight,
                        BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            return CustomButton(
                                isLoading: state is LoginLoadingState,
                                text: AppStrings.login,
                                onTap: () {
                                  cubit.login();
                                });
                          },
                        ).paddingOnly(bottom: 16.h)
                      ],
                    )),
              )),
        ],
      ),
    );
  }
}
