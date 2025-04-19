import 'package:brain_tumr_detection_app/core/components/widgets/posts_row.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/chats/presentation/view/screen/chat_list_screen.dart';
import 'package:brain_tumr_detection_app/features/chats/presentation/view/widgets/custom_messages_text_field.dart';
import 'package:brain_tumr_detection_app/features/chats/presentation/viewmodel/chats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../widgets/message_bubble.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key, required this.chat}) : super(key: key);
  final ChatPreview chat;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatsCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(chat.name, style: AppTextStyles.font20BlueW700),
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0,
        foregroundColor: AppColors.buttonsAndNav,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatsCubit, ChatsState>(
              builder: (context, state) {
                final messages = cubit.allMessages
                    .where((msg) => msg.chatId == chat.chatId)
                    .toList()
                    .reversed
                    .toList();
                return ListView.builder(
                  padding:EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return MessageBubble(message: message).paddingSymmetric(
                      vertical: 10.h
                    );
                  },
                );
              },
            ),
          ),
          CustomMessagesTextField(controller: cubit.messageController ,onSend: ()=>
              cubit.sendMessage(chat.chatId, cubit.messageController.text),),
        ],
      ),
    );
  }
}
