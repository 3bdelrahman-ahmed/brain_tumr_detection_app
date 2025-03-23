import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/string/app_string.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ResendCodeWidget extends StatelessWidget {
  const ResendCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      text: AppStrings.didnotGetCode,
      style: AppTextStyles.font10LightGreenW500.copyWith(fontSize: 13.sp),
      children: <TextSpan>[
        TextSpan(
            text: AppStrings.resendCodeAgain,

            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('Resend code');
              },
            style:
                AppTextStyles.font10LightGreenW500.copyWith(fontSize: 13.sp)),
      ],
    ));
  }
}
