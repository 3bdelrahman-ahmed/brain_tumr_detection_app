import 'package:flutter/material.dart';

extension NavigationExtensions on BuildContext {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static NavigatorState? get navigator => navigatorKey.currentState;

  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigator!.pushNamed(routeName, arguments: arguments);
  }

  void goBack() {
    if (navigator!.canPop()) {
      navigator!.pop();
    }
  }

  void navigateToAndRemoveUntil(String routeName) {
    final currentRoute = ModalRoute.of(navigatorKey.currentContext!);
    if (currentRoute?.settings.name == routeName) {
      return;
    }
    navigator!.pushNamedAndRemoveUntil(routeName, (route) => false);
  }
}
