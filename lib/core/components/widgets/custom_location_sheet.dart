import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/config/app_routing.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/navigation_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../generated/l10n.dart';

class CustomLocationSheet extends StatelessWidget {
  const CustomLocationSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: LottieBuilder.asset(
            "assets/lotties/location.json",
            height: 200.w,
            width: 200.w,
            // fit: BoxFit.contain,
          ),
        ),
        16.toHeight,
        Text(
          S.of(context).toGetFasterResultsPleaseSetYourCurrentLocation,
          textAlign: TextAlign.center,
          style: AppTextStyles.font16GreenW400.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        24.toHeight,
        CustomButton(
          raduis: 8.r,
          text: S.of(context).setLocation,
          onTap: () {
            context.navigateTo(AppRoutes.locationScreen).then((v) {
              Future.delayed(const Duration(milliseconds: 1000), () {
                Navigator.pop(context);
              });
            });
          },
        ),
      ],
    );
  }
}
