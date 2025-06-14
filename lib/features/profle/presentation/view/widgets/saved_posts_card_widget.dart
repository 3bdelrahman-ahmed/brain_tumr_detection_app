import 'package:brain_tumr_detection_app/core/components/widgets/custom_profile_image.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/features/profle/data/models/saved_posts_model.dart';
import 'package:brain_tumr_detection_app/features/profle/presentation/view_model/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'saved_post_author_data.dart';

class SavedPostsCardWidget extends StatelessWidget {
  final SavedPost post;
  SavedPostsCardWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SettingsCubit>();
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
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomProfileImage(
            imageUrl: post.userProfilePicture,
            size: 22.w,
          ),
          12.toWidth,
          Expanded(
            child: SavedPostAuthorDataWidget(
              post: post,
            ),
          ),
          // const Spacer(),
          // if (post. == AppConstants.user!.id)
          //   IconButton(
          //       onPressed: () {
          //         // cubit.deleteComment(comment.id.toString());
          //       },
          //       icon: Icon(
          //         Icons.delete_outline_outlined,
          //         color: AppColors.error,
          //         size: 24.w,
          //       )),
        ],
      ),
    );
  }
}
