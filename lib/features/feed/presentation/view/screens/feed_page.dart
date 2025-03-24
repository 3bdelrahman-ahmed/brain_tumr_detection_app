import 'package:flutter/material.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import '../../../../../../../../../core/utils/string/app_string.dart';
import '../../../../../core/components/widgets/custom_sliver_search_bar.dart';
import '../widgets/post_card.dart';

class FeedPage extends StatelessWidget {
 final ScrollController controller;
   FeedPage({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return CustomScrollView(
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
        SliverPadding(padding: EdgeInsets.only(bottom:72.h)),
      ],
    );
  }
}

