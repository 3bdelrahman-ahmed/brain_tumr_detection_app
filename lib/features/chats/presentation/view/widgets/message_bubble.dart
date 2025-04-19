import 'package:brain_tumr_detection_app/core/components/widgets/custom_app_logo_container.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_profile_image.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/posts_row.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/models/MessageModel.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({Key? key, required this.message}) : super(key: key);
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:message.isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: message.isSentByMe
          ? [
            _buildMessageBubble(context, message),
        10.toWidth,
      CustomProfileImage(
        size: 15.h,
        imageUrl: AppConstants.user?.profilePicture,
      )
            ]
          : [
              CustomProfileImage(
                size: 15.h,
                imageUrl: AppConstants.user?.profilePicture,
              ),
              10.toWidth,
        _buildMessageBubble(context, message)
            ],
    );
  }
}

Widget _buildMessageBubble(BuildContext context, MessageModel message) {
  return Column(
    crossAxisAlignment: message.isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        width: MediaQuery.of(context).size.width -
            MediaQuery.of(context).size.width * .3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: message.isSentByMe ? AppColors.typography : AppColors.buttonsAndNav,
        ),
        child: Text(
          message.message,
          style: AppTextStyles.font12WhiteW500,
        ),
      ),
      3.toHeight,
      Row(
        children: [
          Text(
            DateFormat('hh:mm a').format(message.timestamp),
          ),
          5.toWidth,
          CustomImageView(
              width: 15.w, height: 15.w, svgPath: AssetsSvg.checkMark.toSVG())
        ],
      )
    ],
  );
}
