import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_profile_image.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:flutter/material.dart';
import 'comment_author_data_widget.dart';

class CommentCardWidget extends StatelessWidget {
  const CommentCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.17),
            blurRadius: 6,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
        color: AppColors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomProfileImage(
            imageUrl: AppConstants.user!.profilePicture,
            size: 22.w,
          ),
          12.toWidth,
          Flexible(
            child: CommentAuthorDataWidget(),
          ),
          12.toWidth,
          CustomImageView(
            svgPath: AssetsSvg.commentLikeIcon.toSVG(),
          )
        ],
      ),
    );
  }
}
