import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/features/home/presentation/view/tabs/feed/view/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import '../../../../../../../../core/components/widgets/custom_text_field.dart';
import '../../../../../../../../core/utils/string/app_string.dart';
import '../../../../../../../../foundations/validations.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        CustomWelcomeAppBar(),
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverSearchBarDelegate(),
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
    );
  }
}

class _SliverSearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context)
          .scaffoldBackgroundColor, // Ensures it's not transparent
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: CustomTextField(
        validator: (value) => checkFieldValidation(
            val: value,
            fieldName: AppStrings.search,
            fieldType: ValidationType.text),
        hintText: AppStrings.searchForPosts,
        prefixIcon: AssetsSvg.searchIcon,
      ),
    );
  }

  @override
  double get maxExtent => 75.h; // Increased height for spacing
  @override
  double get minExtent => 75.h; // Same as max for consistency

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
