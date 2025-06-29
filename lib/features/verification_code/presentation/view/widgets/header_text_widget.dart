import 'package:brain_tumr_detection_app/core/utils/strings/app_string.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class HeaderTextWidget extends StatelessWidget {
  const HeaderTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).enterVerificationCode,
      style: AppTextStyles.font20GreenW500,
      textAlign: TextAlign.center,
    );
  }
}
