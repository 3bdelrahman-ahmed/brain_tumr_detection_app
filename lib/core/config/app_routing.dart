import 'package:brain_tumr_detection_app/core/components/cubits/location_cubit/location_cubit.dart';
import 'package:brain_tumr_detection_app/core/components/cubits/navigation_cubit/navigation_cubit.dart';
import 'package:brain_tumr_detection_app/features/doctors/presentation/view/screens/doctors_profile.dart';
import 'package:brain_tumr_detection_app/features/home/presentation/view/home_page.dart';
import 'package:brain_tumr_detection_app/features/login/presentation/view/screens/login_screen.dart';
import 'package:brain_tumr_detection_app/core/components/screens/rigester__location__screen.dart';
import 'package:brain_tumr_detection_app/features/login/presentation/view_model/login_cubit.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view/screens/rigester_screen.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view_model/rigester_screen_cubit.dart';
import 'package:brain_tumr_detection_app/features/verification_code/presentation/view_model/cubit/verification_code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/onboarding/presentation/view/screens/onboarding_screen.dart';
import '../../features/onboarding/presentation/view_model/onboarding_cubit.dart';
import '../../features/splash/presentation/view/screens/splash_screen.dart';
import '../../features/verification_code/presentation/view/screens/verification_code_screen.dart';
import '../services/service_locator/service_locator.dart';

class AppRoutes {
  static const String splashScreen = "/splash";
  static const String onBoardingScreen = "/onBoarding";
  static const String loginScreen = "/login";
  static const String registerScreen = '/rigester';
  static const String locationScreen = '/location';
  static const String homeScreen = '/home';
  static const String verificationCodeScreen = '/verification_code';
  static const String doctorProfileScreen = '/doctorProfile';
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
      case AppRoutes.verificationCodeScreen:
        return animateRouteBuilder(BlocProvider(
          create: (context) => getIt<VerificationCodeCubit>(),
          child: VerificationCodeScreen(
            email: routeSettings.arguments as String,
          ),
        ));
      case AppRoutes.splashScreen:
        return animateRouteBuilder(
          const SplashScreen(),
          duration: 300.ms,
        );
      case AppRoutes.onBoardingScreen:
        return animateRouteBuilder(
            BlocProvider(
              create: (context) => getIt<OnboardingCubit>(),
              child: const OnBoardingScreen(),
            ),
            duration: 300.ms);
      case AppRoutes.loginScreen:
        return animateRouteBuilder(
            BlocProvider(
              create: (context) => getIt<LoginCubit>(),
              child: const LoginScreen(),
            ),
            duration: 300.ms);
      case AppRoutes.doctorProfileScreen:
        return animateRouteBuilder(const DoctorsProfile(), duration: 300.ms);
      case AppRoutes.registerScreen:
        return animateRouteBuilder(
            BlocProvider(
              create: (context) => getIt<RigesterScreenCubit>(),
              child: const RigesterScreen(),
            ),
            duration: 300.ms);
      case AppRoutes.homeScreen:
        return animateRouteBuilder(
            BlocProvider(
              create: (context) => getIt<NavigationCubit>(),
              child: HomeScreen(),
            ),
            duration: 300.ms);
      case AppRoutes.locationScreen:
        return animateRouteBuilder(
            BlocProvider(
              create: (context) => getIt<LocationCubit>(),
              child: LocationScreen(),
            ),
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
