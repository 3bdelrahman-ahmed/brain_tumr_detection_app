import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/widgets/custom_image_view.dart';
import '../../../../../core/utils/assets/assets_svg.dart';
import '../../../../../generated/l10n.dart';

class SucessUploadDialog extends StatelessWidget {
  const SucessUploadDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomImageView(
          svgPath: AssetsSvg.done.toSVG(),
        ),
        20.toHeight,
        Text(
          S.of(context).mriFileUploaded,
          style: AppTextStyles.font15GreenW700,
        ),
        10.toHeight,
        Text(
          S.of(context).youWillRecieveNotificationSoon,
          textAlign: TextAlign.center,
          style: AppTextStyles.font12LightGreenW500.copyWith(fontSize: 15.sp),
        ),
        20.toHeight,
        CustomButton(
          text: S.of(context).returnPage,
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
