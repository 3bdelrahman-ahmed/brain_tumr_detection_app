import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/strings/app_string.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/chats/presentation/viewmodel/chats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../widgets/chat_tile.dart';
class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatsCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppStrings.messages, style: AppTextStyles.font20BlueW700,),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0,
        foregroundColor: AppColors.buttonsAndNav,
      ),
      body: BlocBuilder<ChatsCubit, ChatsState>(
        builder:(context, state){
          return ListView.builder(
            padding: EdgeInsets.only(top: 10.h),
            itemCount: cubit.chats.length,
            itemBuilder: (context, index) {
              return ChatTile(chat: cubit.chats[index]);
            },
          );
        },
      ),
    );
  }
}

class ChatPreview {
  final String chatId;
  final String name;
  final String message;
  final bool isRead;
  final DateTime time;
  ChatPreview({
    required this.isRead,
    required this.chatId,
    required this.name,
    required this.message,
    required this.time,
  });

  ChatPreview copyWith({
    String? chatId,
    String? name,
    String? message,
    bool? isRead,
    DateTime? time,
  }) {
    return ChatPreview(
      chatId: chatId ?? this.chatId,
      name: name ?? this.name,
      message: message ?? this.message,
      time: time ?? this.time,
      isRead: isRead ?? this.isRead,
    );
  }
}

