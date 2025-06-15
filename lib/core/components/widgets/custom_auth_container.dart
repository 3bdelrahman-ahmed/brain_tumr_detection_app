import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';

class CustomAuthContainerWidget extends StatelessWidget {
  final Widget child;
  const CustomAuthContainerWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              color: Colors.black12,
              blurRadius: 4.r,
            )
          ]),
      alignment: Alignment.center,
      child: child,
    );
  }
}
