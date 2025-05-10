import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.background,
  primaryColor: AppColors.buttonsAndNav,
  fontFamily: "Poppins",
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColors.white,
  ),
  buttonTheme: const ButtonThemeData(buttonColor: AppColors.buttonsAndNav),
);
