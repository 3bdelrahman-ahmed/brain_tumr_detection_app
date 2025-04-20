import 'package:brain_tumr_detection_app/core/components/widgets/custom_profile_image.dart';
import 'package:brain_tumr_detection_app/core/config/app_routing.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/responsive_helper.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../foundations/app_constants.dart';
import '../../view_model/chats_cubit.dart';
import '../screen/chat_list_screen.dart';

class ChatTile extends StatelessWidget {
  final ChatPreview chat;
  const ChatTile({super.key, required this.chat});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding:
          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          leading: SizedBox(
            width: ResponsiveHelper.isTablet(context)? 30.w : 50.w,
            child: CustomProfileImage(
              size: 28.w,
              imageUrl: AppConstants.user?.profilePicture,
            ),
          ),
          title: Text(
            chat.name,
            style:chat.isRead ? AppTextStyles.font14BlueW500 : AppTextStyles.font16BlueW700,
          ),
          subtitle: Text(
            chat.message,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style:chat.isRead ? AppTextStyles.font12GreyW500 : AppTextStyles.font15BlackW700,
          ),
          trailing: Text(
            DateFormat('hh:mm a').format(chat.time),
            style: AppTextStyles.font12BlueW500,
          ),
          onTap: (){
            context.read<ChatsCubit>().openChat(chat.chatId);
            Navigator.pushNamed(context, AppRoutes.chatsScreen,arguments:chat);
          },
        ),
      ],
    );
  }
}
