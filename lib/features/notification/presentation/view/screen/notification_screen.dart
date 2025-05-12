import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../widgets/notification_card_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        notificationPredicate: (ScrollNotification notification) {
          return true;
        },
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24.w,
            color: AppColors.buttonsAndNav,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          S.of(context).notifications,
          style: AppTextStyles.font24BlueW700,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          itemBuilder: (context, index) {
            return NotificationCardWidget();
          },
          separatorBuilder: (context, index) => 16.toHeight,
          itemCount: 2),
    );
  }
}
