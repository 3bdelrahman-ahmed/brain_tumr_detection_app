import 'package:flutter/material.dart';

import '../../utils/theme/colors/app_colors.dart';

class CustomOnboardingBackground extends StatelessWidget {
  const CustomOnboardingBackground({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        AppColors.gradientBackground,
        AppColors.gradientBackground,
        AppColors.background,
        AppColors.gradientBackground,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: widget,
    );

  }
}
