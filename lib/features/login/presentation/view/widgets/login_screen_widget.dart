import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_png.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/validators.dart';
import 'package:brain_tumr_detection_app/core/utils/string/app_string.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/login/presentation/viewmodel/login_screen_cubit.dart';

import '../../../../../core/components/widgets/custom_text_field.dart';
import 'forgot_password_sheet.dart';

class LoginScreenWidget extends StatelessWidget {
  const LoginScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginScreenCubit>();
    return SingleChildScrollView(
      child: BlocListener<LoginScreenCubit, LoginScreenState>(
        listener: (context, state) {
          if (state is ShowForgotPasswordState) {
            showModalBottomSheet(
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
          children: [
            CustomImageView(
              imagePath: AssetsPng.loginScreen.toPng(),
              height: 350.h,
            ),
            15.toHeight,
            Center(
              child: Text(
                AppString.login,
                style: AppTextStyles.font20GreenW500,
              ),
            ),
            8.toHeight,
            Center(
              child: Text(
                AppString.heyThereLogin,
                style: AppTextStyles.font15LightGreenW500,
                textAlign: TextAlign.center,
              ),
            ).paddingSymmetric(horizontal: 10.w),
            10.toHeight,
            Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    _buildInputField(
                        label: AppString.email,
                        hintText: AppString.enterYourEmail,
                        controller: cubit.emailController,
                        validator: Validators.emailValidate),
                    30.toHeight,
                    _buildInputField(
                        label: AppString.password,
                        hintText: AppString.enterYourPassword,
                        controller: cubit.passwordController,
                        obscureText: true,
                        validator: Validators.passwordValidate),
                  ],
                ).paddingSymmetric(horizontal: 20.w)),
            InkWell(
              onTap: () => cubit.showForgotPassword(),
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  AppString.forgotPassword,
                  style: AppTextStyles.font15LightGreenW500,
                ),
              ).paddingOnly(right: 20.w),
            ),
            50.toHeight,
            CustomButton(text: AppString.next, onTap: cubit.login)
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hintText,
    TextEditingController? controller,
    String? Function(String?)? validator,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.font15GreenW500),
        5.toHeight,
        CustomTextField(
          hintText: hintText,
          controller: controller,
          validator: validator,
          obscureText: obscureText,
        ),
      ],
    );
  }
}
