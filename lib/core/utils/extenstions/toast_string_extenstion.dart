import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension ToastString on String {
  void showToast(
      {ToastGravity gravity = ToastGravity.BOTTOM,
      Color backgroundColor = AppColors.gradientBackground,
      Color textColor = Colors.white}) {
    Fluttertoast.showToast(
      msg: this,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
    );
  }
}
