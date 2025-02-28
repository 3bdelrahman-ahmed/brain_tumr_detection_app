import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';

import '../../utils/theme/colors/app_colors.dart';
import '../../utils/theme/text_styles/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onTap});

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 300.w,
        height: 55.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: AppColors.buttonsAndNav),
        child: Center(
            child: Text(
          text,
          style: AppTextStyles.font20WhiteW500,
        )),
      ),
    );
  }
}
