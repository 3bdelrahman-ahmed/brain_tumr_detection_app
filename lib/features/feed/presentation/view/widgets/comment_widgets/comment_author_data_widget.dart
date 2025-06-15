import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../data/models/comments_model.dart';

class CommentAuthorDataWidget extends StatelessWidget {
  final Comment comment;
  CommentAuthorDataWidget({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          comment.userName ?? '',
          style: AppTextStyles.font16BlueW700.copyWith(fontSize: 14.sp),
        ),
        2.toHeight,
        Text(
          comment.text ?? '',
          style: AppTextStyles.font12BlueW500.copyWith(fontSize: 12.sp),
        ),
      ],
    );
  }
}
