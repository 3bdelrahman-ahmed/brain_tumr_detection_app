import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.background,
  primaryColor: AppColors.buttonsAndNav,
  fontFamily: "Poppins",
   buttonTheme: const ButtonThemeData(buttonColor: AppColors.buttonsAndNav),
);
