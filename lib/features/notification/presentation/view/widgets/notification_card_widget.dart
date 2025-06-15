import 'package:brain_tumr_detection_app/core/helper/functions/convert_time_slot_function.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import '../../../data/models/notification_response_model/notification.dart'
    as noti;

import 'notification_circular_image.dart';

class NotificationCardWidget extends StatelessWidget {
  final noti.Notification notification;
  const NotificationCardWidget({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        NotificationCircularImage(),
        16.toWidth,
        Expanded(
          // <-- This makes sure the column doesn't overflow
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.title ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.font14BlueW500.copyWith(
                  color: AppColors.buttonsAndNav,
                  fontWeight: FontWeight.w600,
                ),
              ),
              4.toHeight,
              Text(
                notification.body ?? '',
                maxLines: 20,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.font14BlueW500.copyWith(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
        8.toWidth,
        Text(
          formatTimeTo24Hour(notification.createdAt!),
          style: AppTextStyles.font10BlueW600,
        ),
      ],
    );
  }
}
