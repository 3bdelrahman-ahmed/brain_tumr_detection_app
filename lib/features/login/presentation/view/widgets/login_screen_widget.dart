import 'package:brain_tumr_detection_app/core/components/widgets/custom_auth_container.dart';
import 'package:flutter/material.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/string/app_string.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../../../core/components/widgets/custom_app_logo_container.dart';
import 'login_form_widget.dart';

class LoginScreenWidget extends StatelessWidget {
  const LoginScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomAppLogoContainer(),
          15.toHeight,
          Text(
            AppStrings.login,
            style: AppTextStyles.font20GreenW500
                .copyWith(fontWeight: FontWeight.w700),
          ),
          8.toHeight,
          Text(
            AppStrings.heyThereLogin,
            style: AppTextStyles.font15LightGreenW500,
            textAlign: TextAlign.center,
          ),
          16.toHeight,
          CustomAuthContainerWidget(
            child: LoginFormWidget(),
          ),
        ],
      ),
    );
  }
}
