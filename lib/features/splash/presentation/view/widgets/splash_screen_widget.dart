import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/assets/assets_png.dart';

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CustomImageView(
            imagePath: AssetsPng.appLogo.toPng(),
          ),
        ),
        Text(
          "NEROTUM AI",
          style: AppTextStyles.font24GreenW500,
        )
      ],
    );
  }
}
