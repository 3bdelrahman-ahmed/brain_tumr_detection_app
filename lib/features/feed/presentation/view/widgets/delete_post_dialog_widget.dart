import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../../view_model/cubit/feed_cubit.dart';

class DeletePostDialogWidget extends StatelessWidget {
  final String postId;
  const DeletePostDialogWidget({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<FeedCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(S.of(context).areYouSureYouWantToDeleteYourPost,
              textAlign: TextAlign.center,
              style: AppTextStyles.font20GreenW500),
          24.toHeight,
          BlocBuilder<FeedCubit, FeedState>(
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                      child: CustomButton(
                          raduis: 8.r,
                          isLoading: state is DeletePostLoading,
                          backgroundColor: AppColors.error,
                          text: S.of(context).delete,
                          onTap: () {
                            cubit.deletePost(postId, context);
                          })),
                  16.toWidth,
                  Expanded(
                      child: CustomButton(
                          raduis: 8.r,
                          text: S.of(context).cancel,
                          backgroundColor: AppColors.typography,
                          onTap: () {
                            Navigator.pop(context);
                          })),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
