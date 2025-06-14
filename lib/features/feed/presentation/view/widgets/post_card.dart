import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_profile_image.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/like_button/custom_like_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/like_button/custom_save_button.dart';
import 'package:brain_tumr_detection_app/core/helper/functions/format_posts_time_function.dart';
import 'package:brain_tumr_detection_app/core/helper/functions/reach_format_function.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/feed/data/models/posts_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../../../core/utils/assets/assets_svg.dart';
import '../../../../../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/cubit/feed_cubit.dart';

class PostCard extends StatelessWidget {
  Posts post;
  PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<FeedCubit>();
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
          child: BlocBuilder<FeedCubit, FeedState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    post.userName ?? "",
                    style: AppTextStyles.font10GreenW700,
                  ),
                  Text(
                    formatPostTime(post.createdAt ?? ""),
                    style: AppTextStyles.font10LightGreenW500,
                  ),
                  10.toHeight,
                  Text(
                    post.title ?? "",
                    style: AppTextStyles.font20GreenW700,
                  ),
                  5.toHeight,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      post.content ?? "",
                      textAlign: TextAlign.center,
                      maxLines: 3,
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
                        "${reachFormat(post.likesCount ?? 0)} ${S.of(context).likes}",
                        style: AppTextStyles.font12cyanW400,
                      ),
                      10.toWidth,
                      Text(
                        "${reachFormat(post.commentsCount ?? 0)} ${S.of(context).comments}",
                        style: AppTextStyles.font12cyanW400,
                      ),
                    ],
                  ),
                  30.toHeight,
                  // Buttons Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LikeButton(
                          onPressed: () {
                            cubit.toggleLikePost(post.id.toString());
                          },
                          isLike: post.isLiked!),
                      // _buildButton(Icons.favorite, AppStrings.like),
                      _buildButton(
                          AssetsSvg.commentIcon, S.of(context).comment),
                      CustomSaveButton(
                          text: S.of(context).save,
                          isSaved: post.isSaved!,
                          onPressed: () {
                            cubit.toggleSavePost(post.id.toString());
                          }),
                      // _buildButton(AssetsSvg.saveIcon, S.of(context).save),
                    ],
                  ),
                  // 12.toHeight,
                  // Divider(
                  //   color: Colors.grey.withOpacity(0.5),
                  //   height: 1,
                  // ),
                  // 12.toHeight,
                  // CommentCardWidget()
                ],
              );
            },
          ).paddingOnly(top: 24.h),
        ),
        // Profile Image Positioned Above the Card
        PositionedDirectional(
          top: -48.h,
          start: 0,
          end: 0,
          child: Center(
            child: CustomProfileImage(
              size: 40.w,
              imageUrl: post.userProfilePicture,
            ),
          ),
        ),
      ],
    )
        .paddingOnly(bottom: 32.h)
        .animate()
        .fadeIn(duration: Duration(milliseconds: 300));
  }

  Widget _buildButton(String icon, String label) {
    return Row(
      children: [
        CustomImageView(
          svgPath: icon.toSVG(),
          width: 22.w,
          height: 22.w,
        ),
        5.toWidth,
        Text(
          label,
          style: AppTextStyles.font12cyanW700,
        ),
      ],
    );
  }
}
