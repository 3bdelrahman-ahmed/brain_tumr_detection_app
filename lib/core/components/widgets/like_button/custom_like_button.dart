import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/string/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../utils/theme/text_styles/app_text_styles.dart';
import '../custom_image_view.dart';
import 'custom_heart_animation_widget.dart';

class LikeButton extends StatelessWidget {
  const LikeButton(
      {super.key,
      this.onPressed,
      required this.isLike,
      this.width,
      this.height,
      this.color});
  final Color? color;
  final bool isLike;
  final double? width;
  final double? height;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: onPressed,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.h),
            width: 25.w,
            height: 25.w,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: HeartAnimation(
              isAnimating: isLike,
              alwaysAnimate: true,
              duration: 100.ms,
              child: CustomImageView(
                svgPath: isLike
                    ? AssetsSvg.heartIcon.toSVG()
                    : AssetsSvg.heartIcon.toSVG(),
                color: isLike ? Colors.red : color,
                onTap: onPressed,
                // width: width?.w ?? 24.w,
                // height: height?.h ?? 24.w,
              ),
            ),
          ),
          5.toWidth,
          Text(
            AppStrings.like,
            style: AppTextStyles.font12cyanW700,
          )
        ],
      ),
    );
  }
}
