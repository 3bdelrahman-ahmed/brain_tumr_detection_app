import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_profile_image.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/chats/data/models/message.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({Key? key, required this.message, required this.profileUrl}) : super(key: key);
  final Message message;
  final String? profileUrl;
  @override
  Widget build(BuildContext context) {
    bool isMe = message.senderId == AppConstants.user?.id;
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: isMe
          ? [
              _buildMessageBubble(context, message, isMe),
              10.toWidth,
              CustomProfileImage(
                size: 15.h,
                imageUrl: AppConstants.user?.profilePicture,
              )
            ]
          : [
              CustomProfileImage(
                size: 15.h,
                imageUrl: profileUrl,
              ),
              10.toWidth,
              _buildMessageBubble(context, message, isMe)
            ],
    );
  }
}

Widget _buildMessageBubble(BuildContext context, Message message, bool isMe) {
  return Column(
    crossAxisAlignment:
        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
    children: [
      Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width -
              MediaQuery.of(context).size.width * .3,
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: isMe ? AppColors.typography : AppColors.buttonsAndNav,
        ),
        child: Text(
          message.content,
          style: AppTextStyles.font12WhiteW500,
        ),
      ),
      3.toHeight,
      Row(
        children: [
          Text(
            DateFormat('hh:mm a').format(message.sentAt),
          ),
          5.toWidth,
          if (isMe && message.status != null) ...[
            _buildStatusMessage(message.status!)
          ]        ],
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
