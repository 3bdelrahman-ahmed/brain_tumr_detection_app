import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';
import 'custom_image_view.dart';
import '../../utils/assets/assets_png.dart';
import '../../utils/string/app_string.dart';
import '../../utils/theme/text_styles/app_text_styles.dart';

class CustomWelcomeAppBar extends StatelessWidget {
  final String? userName;
  const CustomWelcomeAppBar({Key? key, this.userName}) : super(key: key);

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
                  AppStrings.welcomeBack,
                  style: AppTextStyles.font15LightGreenW500,
                ),
                SizedBox(
                  width: 150.w,
                  child: Text(
                    userName ?? "Lionel Messi 🐐",
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
                CustomImageView(
                  imagePath: AssetsPng.chat.toPng(),
                  width: 30.w,
                  height: 30.w,
                ),
                SizedBox(width: 10.w),
                CustomImageView(
                  imagePath: AssetsPng.notifications.toPng(),
                  width: 30.w,
                  height: 30.w,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
