import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';

import '../../utils/theme/colors/app_colors.dart';
import '../../utils/theme/text_styles/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final double? raduis;
  final TextStyle? textStyle;
  final Color? circularInticatorColor;
  final bool? isLoading;
  const CustomButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.raduis,
      this.isLoading = false,
      this.circularInticatorColor,
      this.backgroundColor,
      this.textStyle,
      this.height,
      this.width});

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 12.h),
        width: width ?? 300.w,
        height: height ?? 55.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(raduis ?? 30.r),

            color: backgroundColor ?? AppColors.buttonsAndNav),
        alignment: Alignment.center,
        child: (isLoading ?? false)
            ? SizedBox(
                height: 20.w,
                width: 20.w,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      circularInticatorColor ?? AppColors.background),
                ),
              )
            : Text(
              text,
              textAlign: TextAlign.center,
              style: textStyle ?? AppTextStyles.font20WhiteW500,
            ),
      ),
    );
  }
}
