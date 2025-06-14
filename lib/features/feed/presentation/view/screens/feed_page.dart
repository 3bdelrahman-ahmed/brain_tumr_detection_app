import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/config/app_routing.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/feed/presentation/view_model/cubit/feed_cubit.dart';
import 'package:flutter/material.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/widgets/custom_app_shimmer.dart';
import '../../../../../core/components/widgets/custom_empty_widget.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../widgets/post_card.dart';

class FeedPage extends StatefulWidget {
  final ScrollController controller;

  const FeedPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  late FeedCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<FeedCubit>();
    cubit.fetchFeed();

    cubit.scrollController.addListener(() {
      if (cubit.scrollController.position.pixels >=
              cubit.scrollController.position.maxScrollExtent - 100 &&
          cubit.state is! FeedLoading &&
          cubit.posts?.nextCursor != null &&
          cubit.posts!.nextCursor != 0) {
        cubit.fetchMorePosts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<FeedCubit, FeedState>(
          builder: (context, state) {
            if (state is FeedLoading && cubit.posts == null) {
              return CustomScrollView(
                controller: cubit.scrollController,
                slivers: [
                  CustomWelcomeAppBar(),
                  SliverToBoxAdapter(
                    child: CustomAppShimmer(
                      height: 220.h,
                      width: double.infinity,
                      borderRaduis: 12.r,
                    ),
                  ),
                ],
              );
            }

            if (cubit.posts == null || cubit.posts!.posts!.isEmpty) {
              return CustomScrollView(
                controller: cubit.scrollController,
                slivers: [
                  CustomWelcomeAppBar(),
                  SliverToBoxAdapter(
                    child: CustomEmptyWidget(
                      title: "No posts available",
                    ),
                  ),
                ],
              );
            }

            final posts = cubit.posts!.posts!;
            return CustomScrollView(
              controller: cubit.scrollController,
              slivers: [
                CustomWelcomeAppBar(),
                SliverPadding(padding: EdgeInsets.only(bottom: 16.h)),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index == posts.length) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: CustomAppShimmer(
                            height: 220.h,
                            width: double.infinity,
                            borderRaduis: 12.r,
                          ),
                        );
                      }
                      return Padding(
                        padding:
                            EdgeInsets.only(top: 16.h, left: 20.w, right: 20.w),
                        child: PostCard(post: posts[index]),
                      );
                    },
                    childCount: cubit.posts!.nextCursor != null
                        ? posts.length + 1
                        : posts.length,
                  ),
                ),
                SliverPadding(padding: EdgeInsets.only(bottom: 72.h)),
              ],
            );
          },
        ),

        /// Floating Action Button (FAB)
        Positioned(
          bottom: 100.h,
          right: 20.w,
          child: Tooltip(
            message: "Add a new post",
            textStyle: AppTextStyles.font12BlueW700,
            // preferBelow: false,
            decoration: BoxDecoration(color: AppColors.background),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.addPostScreen);
              },
              child: Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.buttonsAndNav,
                ),
                child: CustomImageView(
                  svgPath: AssetsSvg.plus.toSVG(),
                ),
              ),
            ).animate().flipH(duration: 500.ms),
          ),
        ),
      ],
    );
  }
}
