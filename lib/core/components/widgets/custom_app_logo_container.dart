import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_png.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';

import '../../utils/theme/colors/app_colors.dart';

class CustomAppLogoContainer extends StatelessWidget {
  const CustomAppLogoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.w),
      width: 100.w,
      height: 100.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 10.r,
              color: Colors.black.withOpacity(0.2),
            ),
          ],
          gradient: LinearGradient(colors: [
            AppColors.gradientBackground,
            AppColors.gradientBackground,
            AppColors.background,
            AppColors.gradientBackground,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      alignment: Alignment.center,
      child: CustomImageView(
        imagePath: AssetsPng.appLogo.toPng(),
      ),
    );
  }
}
