import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/strings/app_string.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../generated/l10n.dart';

class BiometricAuthDialogWidget extends StatelessWidget {
  const BiometricAuthDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,   
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,  
      children: [
        LottieBuilder.asset(  
          "assets/lotties/biometric_auth.json",
          width: 175.w,
          height: 175.w,
          fit: BoxFit.cover,
          repeat: true,
          animate: true,
        ),
        Text(
          AppStrings.biometricAuthenticationEnabled,
          style: AppTextStyles.font15GreenW700,
          textAlign: TextAlign.center,
        ),
        6.toHeight,
        Text(
          S.of(context).nextTimeYouLogin,
          style: AppTextStyles.font12LightGreenW500.copyWith(fontSize: 14.sp),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
        16.toHeight,
        CustomButton(
            width: 100.w,
            height: 50.h,
            raduis: 12.r,
            textStyle: AppTextStyles.font15GreenW500
                .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
            text: S.of(context).gotIt,
            onTap: () {
              Navigator.pop(context);
            }),
      ],
    ).paddingAll(12.w);
  }
}
