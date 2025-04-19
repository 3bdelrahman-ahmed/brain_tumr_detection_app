import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_profile_image.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
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
    bool isMe = message.isSentByMe;
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: isMe
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
    crossAxisAlignment:
        message.isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
    children: [
      Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width -
              MediaQuery.of(context).size.width * .3,
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: message.isSentByMe
              ? AppColors.typography
              : AppColors.buttonsAndNav,
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
          if (message.isSentByMe)...[_buildStatusMessage(message.status)]
        ],
      )
    ],
  );
}

Widget _buildStatusMessage(MessageStatus status) {
  switch (status) {
    case MessageStatus.SENT:
      return CustomImageView(
          width: 15.w, height: 15.w, svgPath: AssetsSvg.checkMark.toSVG());
    case MessageStatus.PENDING:
      return CustomImageView(
          width: 15.w, height: 15.w, svgPath: AssetsSvg.pending.toSVG());
    case MessageStatus.FAILED:
      return CustomImageView(
          width: 15.w, height: 15.w, svgPath: AssetsSvg.failed.toSVG());
    default:
      return Container();
  }
}
