import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_png.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationCircularImage extends StatelessWidget {
  const NotificationCircularImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
            radius: 30.r,
            backgroundColor: AppColors.notificationBackgroundColor,
            child: CustomImageView(
              imagePath: AssetsPng.appLogo.toPng(),
              width: 40.w,
              height: 40.w,
            )),
        PositionedDirectional(
            bottom: -8.h,
            end: -10.w,
            child: CustomImageView(
              svgPath: AssetsSvg.notification.toSVG(),
              width: 32.w,
              height: 32.w,
            )),
      ],
    );
  }
}
