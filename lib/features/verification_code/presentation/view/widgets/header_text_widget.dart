import 'package:brain_tumr_detection_app/core/utils/string/app_string.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class HeaderTextWidget extends StatelessWidget {
  const HeaderTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.enterVerificationCode,
      style: AppTextStyles.font20GreenW500,
      textAlign: TextAlign.center,
    );
  }
}
