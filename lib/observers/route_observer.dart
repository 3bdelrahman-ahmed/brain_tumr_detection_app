import 'package:flutter/material.dart';

class MyRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  String? currentRoute;
// Set the initial route manually (e.g., splash screen or login screen)
  void setInitialRoute(String routeName) {
    currentRoute = routeName;
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _updateCurrentRoute(route);
    print('didPush: ${route.settings.name}');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _updateCurrentRoute(previousRoute);
    print('didPop: ${previousRoute?.settings.name}');
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _updateCurrentRoute(previousRoute);
    print('didRemove: ${previousRoute?.settings.name}');
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _updateCurrentRoute(newRoute);
    print('didReplace: ${newRoute?.settings.name}');
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  void _updateCurrentRoute(Route? route) {
    if (route is PageRoute) {
      currentRoute = route.settings.name;
    }
  }
}

// Initialize RouteObserver
final MyRouteObserver routeObserver = MyRouteObserver();
