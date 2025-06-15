import 'package:brain_tumr_detection_app/core/components/widgets/custom_app_shimmer.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_empty_widget.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/profle/presentation/view_model/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../generated/l10n.dart';
import 'saved_posts_card_widget.dart';

class SavedPostsWidget extends StatefulWidget {
  const SavedPostsWidget({super.key});

  @override
  State<SavedPostsWidget> createState() => _SavedPostsWidgetState();
}

class _SavedPostsWidgetState extends State<SavedPostsWidget> {
  @override
  void initState() {
    context.read<SettingsCubit>().savedPostsScrollController.addListener(() {
      if (context
                  .read<SettingsCubit>()
                  .savedPostsScrollController
                  .position
                  .pixels >=
              context
                      .read<SettingsCubit>()
                      .savedPostsScrollController
                      .position
                      .maxScrollExtent -
                  100 &&
          context.read<SettingsCubit>().state is! SavedPostsLoadingState &&
          context.read<SettingsCubit>().savedPostsList.isNotEmpty) {
        context.read<SettingsCubit>().loadMoreSavedPosts();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SettingsCubit>();
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        // if(cubit)
        if (cubit.savedPostsList.isEmpty && state is SavedPostsLoadingState) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            separatorBuilder: (context, index) => 12.toHeight,
            itemBuilder: (context, index) => CustomAppShimmer(
              height: 100.h,
              borderRaduis: 16.r,
            ),
          );
        } else if (cubit.savedPostsList.isNotEmpty) {
          return ListView.separated(
              // controller: cubit.savedPostsScrollController,
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
                // vertical: 20.h,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cubit.savedPostsList.length +
                  (state is LoadMoreSavedPostsLoadingState ? 1 : 0),
              separatorBuilder: (context, index) => 12.toHeight,
              itemBuilder: (context, index) {
                // return shimmer if loading more
                if (index == cubit.savedPostsList.length &&
                    state is LoadMoreSavedPostsLoadingState) {
                  return CustomAppShimmer(
                    height: 75.h,
                    borderRaduis: 16.r,
                  );
                }
                return SavedPostsCardWidget(
                  post: cubit.savedPostsList[index],
                );
              });
        } else {
          return Center(
              child: CustomEmptyWidget(
            title: S.of(context).noSavedPostsYet,
          ));
        }
      },
    );
  }
}
