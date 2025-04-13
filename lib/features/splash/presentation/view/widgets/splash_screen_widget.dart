import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_onboarding_background.dart';
import 'package:brain_tumr_detection_app/core/config/app_routing.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigateToHome();
    });
    // navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return CustomOnboardingBackground(
        widget: Center(
      child: CustomImageView(
        imagePath: AssetsPng.appLogo.toPng(),
        height: 250.h,
      ).animate().fadeIn(duration: Duration(seconds: 2)),
    ));
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 4),
      () async {
        AppConstants.getOnBoardingBoolean().then((value) {
          if (!value) {
            Navigator.pushReplacementNamed(context, AppRoutes.onBoardingScreen);
          } else {
            AppConstants.getToken().then((val) {
              if (val.toString().isNotEmpty && AppConstants.getUser() != null) {
                Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
              } else {
                Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
              }
            });
          }
        });
      },
    );
  }
}
