import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/widgets/custom_onboarding_background.dart';


class LoginScreenWidget extends StatelessWidget {
  const LoginScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOnboardingBackground(
      widget: Center(child: Text("Login Screen",style: AppTextStyles.font24GreenW500,))
    );
  }
}
