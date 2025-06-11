import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import '../../config/app_routing.dart';
import '../../services/notification_service/badge_service.dart';
import 'custom_image_view.dart';
import '../../utils/assets/assets_png.dart';
import '../../utils/theme/text_styles/app_text_styles.dart';

class CustomWelcomeAppBar extends StatelessWidget {

  CustomWelcomeAppBar({Key? key,}) : super(key: key);
  final BadgeService _badgeService = BadgeService.instance;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      pinned: false,
      snap: true,
      floating: true,
      expandedHeight: 75.h,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration:
            BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).welcomeBack,
                  style: AppTextStyles.font15LightGreenW500,
                ),
                SizedBox(
                  width: 150.w,
                  child: Text(
                    AppConstants.user?.userName ?? "Lionel Messi 🐐",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.font20GreenW700,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.chatsListScreen),
                  child: CustomImageView(
                    imagePath: AssetsPng.chat.toPng(),
                    width: 30.w,
                    height: 30.w,
                  ),
                ),
                SizedBox(width: 10.w),
                GestureDetector(
                  onTap: () {
                    _badgeService.updateBadgeVisibility(false);
                    Navigator.pushNamed(context, AppRoutes.notificationScreen);
                  },
                  child: StreamBuilder<bool>(
                    stream: _badgeService
                        .badgeStream, 
                    builder: (context, snapshot) {
                      bool isBadgeVisible =
                          snapshot.data ?? false; 

                      return Badge(
                        backgroundColor: AppColors.error,
                        isLabelVisible: isBadgeVisible,
                        largeSize: 24,
                        smallSize: 8,
                        child: CustomImageView(
                          imagePath: AssetsPng.notifications.toPng(),
                          width: 30.w,
                          height: 30.w,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
