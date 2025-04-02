import 'package:brain_tumr_detection_app/core/components/widgets/custom_app_logo_container.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/config/app_routing.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import '../../../../../../../../../core/utils/string/app_string.dart';
import '../../../../../core/components/widgets/custom_sliver_search_bar.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../widgets/post_card.dart';

class FeedPage extends StatelessWidget {
  final ScrollController controller;

  FeedPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Main Content
        CustomScrollView(
          controller: controller,
          shrinkWrap: true,
          slivers: [
            CustomWelcomeAppBar(),
            SliverPersistentHeader(
              pinned: true,
              delegate: CustomSliverSearchBar(AppStrings.searchForPosts),
            ),
            SliverPadding(padding: EdgeInsets.only(bottom: 16.h)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                addAutomaticKeepAlives: true,
                (context, index) => Padding(
                  padding: EdgeInsets.only(top: 16.h, left: 20.w, right: 20.w),
                  child: PostCard(),
                ),
                childCount: 5,
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(bottom: 72.h)),
          ],
        ),

        /// Floating Action Button (FAB)
        Positioned(
          bottom: 100.h,
          right: 20.w,
          child: Tooltip(
            message: "Add a new post",
            textStyle: AppTextStyles.font12BlueW700,
            preferBelow: false,
            decoration: BoxDecoration(
              color: AppColors.background
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context,AppRoutes.addPostScreen);
              },
              child: Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.buttonsAndNav
                ),
                child: CustomImageView(
                  svgPath: AssetsSvg.plus.toSVG(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
