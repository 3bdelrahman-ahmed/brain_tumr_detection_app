import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../core/components/widgets/custom_image_view.dart';
import '../../../../../../../../core/utils/assets/assets_png.dart';
import '../../../../../../../../core/utils/string/app_string.dart';
import '../../../../../../../../core/utils/theme/text_styles/app_text_styles.dart';

class WelcomeRow extends StatelessWidget {
  const WelcomeRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              AppStrings.welcomeBack,
              style: AppTextStyles.font15LightGreenW500,
            ),
            Text(
              "Lionel Messi",
              style: AppTextStyles.font20GreenW700,
            )
          ],
        ),
        Spacer(),
        CustomImageView(
          imagePath: AssetsPng.chat.toPng(),
          width: 35.w,
          height: 35.h,
        ),
        10.toWidth,
        CustomImageView(
          imagePath: AssetsPng.notifications.toPng(),
          width: 40.w,
          height: 40.h,
        ).paddingOnly(top: 4.h)
      ],
    );
  }
}
