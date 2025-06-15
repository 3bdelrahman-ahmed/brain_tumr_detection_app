import 'package:flutter/material.dart';

import 'navigation_extenstions.dart';

extension ResponsiveExtensions on num {
  /// Get responsive width based on screen width
  double get w => this * MediaQuery.of(_context).size.width / 375;

  /// Get responsive height based on screen height
  double get h => this * MediaQuery.of(_context).size.height / 812;

  /// Get responsive text size based on screen width
  double get sp => this * MediaQuery.of(_context).size.width / 375;

  /// Get responsive radius size based on screen width
  double get r => this * MediaQuery.of(_context).size.width / 375;

  /// Get empty height space based on screen height
  Widget get toHeight => SizedBox(height: h);

  /// Get empty width space based on screen width
  Widget get toWidth => SizedBox(width: w);

  static BuildContext get _context =>
      NavigationExtensions.navigatorKey.currentContext!;
}
