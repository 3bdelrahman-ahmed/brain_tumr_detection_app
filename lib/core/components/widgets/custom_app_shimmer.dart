import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/theme/colors/app_colors.dart';

class CustomAppShimmer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final double? borderRaduis;

  const CustomAppShimmer(
      {super.key, this.child, this.borderRaduis, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 1500),
      baseColor: AppColors.gradientBackground.withOpacity(0.24),
      highlightColor: AppColors.white,
      child: child ??
          Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRaduis ?? 21.r),
                color: AppColors.gradientBackground.withOpacity(0.24),
              ),
              child: child),
    );
  }
}
