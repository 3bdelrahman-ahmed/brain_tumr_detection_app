import 'package:brain_tumr_detection_app/core/components/widgets/custom_app_shimmer.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_empty_widget.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_text_field.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/features/feed/presentation/view/widgets/comment_widgets/comment_card_widget.dart';
import 'package:brain_tumr_detection_app/features/feed/presentation/view_model/cubit/feed_cubit.dart';
import 'package:brain_tumr_detection_app/foundations/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';

class CommentsBottomSheetWidget extends StatefulWidget {
  final String postId;
  const CommentsBottomSheetWidget({super.key, required this.postId});

  @override
  State<CommentsBottomSheetWidget> createState() =>
      _CommentsBottomSheetWidgetState();
}

class _CommentsBottomSheetWidgetState extends State<CommentsBottomSheetWidget> {
  @override
  void initState() {
    context.read<FeedCubit>().fetchPostComments(widget.postId);
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<FeedCubit>();

    return AnimatedPadding(
      duration: const Duration(milliseconds: 300),
      padding: MediaQuery.of(context).viewInsets,
      curve: Curves.easeOut,
      child: SizedBox(
        height: 600.h,
        child: Column(
          children: [
            // COMMENTS LIST
            Expanded(
              child: BlocBuilder<FeedCubit, FeedState>(
                builder: (context, state) {
                  if (cubit.postComments.isEmpty && state is CommmentsLoading) {
                    return ListView.separated(
                      padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                      itemBuilder: (context, index) => CustomAppShimmer(
                        height: 80.h,
                        borderRaduis: 12.r,
                      ),
                      separatorBuilder: (context, index) => 12.toHeight,
                      itemCount: 3,
                    );
                  } else if (cubit.postComments.isNotEmpty) {
                    return ListView.separated(
                      padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                      itemBuilder: (context, index) => CommentCardWidget(
                        comment: cubit.postComments[index],
                      ).animate().fadeIn(duration: 300.ms),
                      separatorBuilder: (context, index) => 12.toHeight,
                      itemCount: cubit.postComments.length,
                    );
                  } else {
                    return Center(
                      child: CustomEmptyWidget(
                        title: S.of(context).noCommentsOnThisPostYet,
                      ),
                    );
                  }
                },
              ),
            ),

            // COMMENT INPUT FIELD
            BlocBuilder<FeedCubit, FeedState>(
              buildWhen: (previous, current) => current is CommentTextChanged,
              builder: (context, state) {
                final hasText = state is CommentTextChanged && state.hasText;

                return Container(
                  color: AppColors.white,
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: CustomTextField(
                          keyboardType: TextInputType.multiline,
                          controller: cubit.commentController,
                          onChanged: cubit.validateComment,
                          validator: (v) => checkFieldValidation(
                            val: cubit.commentController.text,
                            fieldName: S.of(context).comment,
                            fieldType: ValidationType.text,
                          ),
                          hintText: S.of(context).writeYourComment,
                        ),
                      ),
                      if (hasText)
                        Expanded(
                          child: CustomImageView(
                            onTap: () => cubit.addComment(widget.postId),
                            width: 32.w,
                            height: 32.w,
                            color: AppColors.typography,
                            svgPath: AssetsSvg.sendMessage.toSVG(),
                          ).animate().flipV(duration: 300.ms),
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
