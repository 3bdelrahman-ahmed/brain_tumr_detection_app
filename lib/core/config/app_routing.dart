import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../features/splash/presentation/view/screens/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = "/splash";
}

class AppRouter {
  static Route<dynamic> animateRouteBuilder(
    Widget widget, {
    Duration? duration,
  }) {
    return buildPageRoute(
        widget,
        duration ?? 300.ms);
  }

  static Route? onGenerateRoute(RouteSettings routeSettings) {
    var args = routeSettings.arguments;
    switch (routeSettings.name) {
      case AppRoutes.splashScreen:
        return animateRouteBuilder(
          const SplashScreen(),
          duration: 300.ms,
        );
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
