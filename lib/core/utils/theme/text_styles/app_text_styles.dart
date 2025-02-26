import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();
  static  TextStyle font24GreenW500 = const TextStyle(
    fontSize: 24,
    color: AppColors.typography,
    fontWeight: FontWeight.w500,
  );
  static  TextStyle font16GreenW400 = const TextStyle(
    fontSize: 16,
    color: AppColors.typography,
    fontWeight: FontWeight.w400,
  );
  static  TextStyle font20WhiteW500 = const TextStyle(
    fontSize: 20,
    color: AppColors.background,
    fontWeight: FontWeight.w500,
  );
}
