import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/theme/text_styles/app_text_styles.dart';

class CommentAuthorDataWidget extends StatelessWidget {
  const CommentAuthorDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConstants.user!.fullName!,
          style: AppTextStyles.font16BlueW700.copyWith(fontSize: 12.sp),
        ),
        2.toHeight,
        Text(
          "You are a fighter, and this battle doesn’t define you—it’s just one chapter of your story. Take it day by day, and don’t be afraid to lean on those who love you. We’re all cheering you on! 🙌🔥",
          style: AppTextStyles.font12BlueW500.copyWith(fontSize: 10.sp),
        ),
      ],
    );
  }
}
