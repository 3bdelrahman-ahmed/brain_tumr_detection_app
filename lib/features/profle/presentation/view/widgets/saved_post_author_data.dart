import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/profle/data/models/saved_posts_model.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/theme/text_styles/app_text_styles.dart';

class SavedPostAuthorDataWidget extends StatelessWidget {
  final SavedPost post;
  SavedPostAuthorDataWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          post.userName ?? '',
          style: AppTextStyles.font16BlueW700.copyWith(fontSize: 14.sp),
        ),
        2.toHeight,
        Text(
          post.content ?? '',
          style: AppTextStyles.font12BlueW500.copyWith(fontSize: 12.sp),
        ),
      ],
    );
  }
}
