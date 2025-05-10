import 'package:flutter/material.dart';

/// **Padding Extensions**
extension PaddingExtensions on Widget {
  Widget paddingAll(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );

  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );

  Widget paddingOnly({
    double left = 0,
    double right = 0,
    double top = 0,
    double bottom = 0,
  }) =>
      Padding(
        padding:
            EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
        child: this,
      );
}

/// **Alignment Extensions**
extension AlignmentExtensions on Widget {
  Widget center() => Center(child: this);
  Widget alignTop() => Align(alignment: Alignment.topCenter, child: this);
  Widget alignBottom() => Align(alignment: Alignment.bottomCenter, child: this);
  Widget alignLeft() => Align(alignment: Alignment.centerLeft, child: this);
  Widget alignRight() => Align(alignment: Alignment.centerRight, child: this);
}

/// **Visibility Extensions**
extension VisibilityExtensions on Widget {
  Widget visible(bool isVisible) => isVisible ? this : const SizedBox.shrink();
}
