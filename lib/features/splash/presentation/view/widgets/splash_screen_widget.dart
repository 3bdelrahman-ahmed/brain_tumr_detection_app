import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/config/app_routing.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../../core/utils/assets/assets_png.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors:[
                AppColors.gradientBackground,
                AppColors.gradientBackground,
                AppColors.background,
                AppColors.gradientBackground,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        ),
        Center(
          child: CustomImageView(
            imagePath: "assets/image/app_logo.png",
            height: 200.h,
          ).animate().fadeIn(
            duration:Duration(seconds:3)
          ),
        )
      ],
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
          () async {
        Navigator.pushReplacementNamed(context, AppRoutes.onBoardingScreen);
      },
    );
  }
}
