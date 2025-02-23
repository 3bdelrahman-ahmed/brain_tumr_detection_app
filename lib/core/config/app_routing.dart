import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../features/splash/presentation/view/screens/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = "/splash";
}

class AppRouter {
  static Route<dynamic> animateRouteBuilder(
    Widget widget, {
    PageRouteAnimation? pageRouteAnimation,
    Duration? duration,
  }) {
    return buildPageRoute(
        widget,
        pageRouteAnimation ?? PageRouteAnimation.SlideBottomTop,
        duration ?? 300.ms);
  }

  static Route? onGenerateRoute(RouteSettings routeSettings) {
    var args = routeSettings.arguments;
    switch (routeSettings.name) {
      case AppRoutes.splashScreen:
        return animateRouteBuilder(
          const SplashScreen(),
          pageRouteAnimation: PageRouteAnimation.SlideBottomTop,
          duration: 300.ms,
        );
      default:
        return null;
    }
  }
}
