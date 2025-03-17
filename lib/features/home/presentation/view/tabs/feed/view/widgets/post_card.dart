import 'package:brain_tumr_detection_app/core/helper/functions/reach_format_function.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/string/app_string.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../core/utils/assets/assets_png.dart';
import '../../../../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../../../../core/utils/theme/text_styles/app_text_styles.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                spreadRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Mazen Nigga",
                style: AppTextStyles.font10GreenW700,
              ),
              Text(
                "Today at 1:58 am",
                style: AppTextStyles.font10LightGreenW500,
              ),
              10.toHeight,
              Text(
                "Low-Grade Glioma",
                style: AppTextStyles.font20GreenW700,
              ),
              5.toHeight,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  "Hi everyone, I recently got my MRI results, and the AI flagged something unusual. Has anyone here had experience with a low-grade glioma?",
                  textAlign: TextAlign.center,
                  // maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.font12LightGreenW500,
                ),
              ),
              30.toHeight,
              // Likes and Comments Counter
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${reachFormat(480000000)} ${AppStrings.likes}",
                    style: AppTextStyles.font12cyanW400,
                  ),
                  10.toWidth,
                  Text(
                    "${reachFormat(690000000)} ${AppStrings.comments}",
                    style: AppTextStyles.font12cyanW400,
                  ),
                ],
              ),
              30.toHeight,
              // Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton(Icons.favorite, AppStrings.like),
                  _buildButton(Icons.mode_comment_rounded, AppStrings.comment),
                  _buildButton(Icons.bookmark, AppStrings.save),
                ],
              ),
            ],
          ).paddingOnly(top: 24.h),
        ),
        // Profile Image Positioned Above the Card
        PositionedDirectional(
            top: -25.h,
            start: 0,
            end: 0,
            child: Container(
              height: 50.w,
              width: 50.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(
                        AssetsPng.doctorTest.toPng(),
                      ),
                      fit: BoxFit.cover)),
            )),
      ],
    ).paddingOnly(bottom: 32.h);
  }

  Widget _buildButton(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: AppColors.smallDetails, size: 18),
        5.toWidth,
        Text(
          label,
          style: AppTextStyles.font12cyanW700,
        ),
      ],
    );
  }
}
