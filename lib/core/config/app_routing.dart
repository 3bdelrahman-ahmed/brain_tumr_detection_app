import 'package:brain_tumr_detection_app/features/login/presentation/view/screens/login_screen.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view/screens/rigester__location__screen.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view/screens/rigester_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../features/onboarding/presentation/view/screens/onboarding_screen.dart';
import '../../features/splash/presentation/view/screens/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = "/splash";
  static const String onBoardingScreen = "/onBoarding";
  static const String loginScreen = "/login";
  static const String registerScreen = '/rigester';
  static const String locationScreen = 'location';
}

class AppRouter {
  static Route<dynamic> animateRouteBuilder(
    Widget widget, {
    Duration? duration,
  }) {
    return buildPageRoute(widget, duration ?? 300.ms);
  }

  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.splashScreen:
        return animateRouteBuilder(
          const SplashScreen(),
          duration: 300.ms,
        );
      case AppRoutes.onBoardingScreen:
        return animateRouteBuilder(const OnBoardingScreen(), duration: 300.ms);
      case AppRoutes.loginScreen:
        return animateRouteBuilder(const LoginScreen(), duration: 300.ms);
      case AppRoutes.registerScreen:
        return animateRouteBuilder(const RigesterScreen(), duration: 300.ms);
      case AppRoutes.locationScreen:
        return animateRouteBuilder(const RegisterLocationScreen(),
            duration: 300.ms);
      default:
        return null;
    }
  }
}

Route buildPageRoute(Widget page, Duration duration) {
  return PageRouteBuilder(
    transitionDuration: duration,
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      /// **Custom animation: Slide from bottom**
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1), // Start from bottom
          end: Offset.zero, // End at normal position
        ).animate(animation),
        child: child,
      );
    },
  );
}
