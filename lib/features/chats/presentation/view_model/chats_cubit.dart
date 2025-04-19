import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/models/MessageModel.dart';
import '../view/screen/chat_list_screen.dart';

part 'chats_state.dart';
@injectable
class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit() : super(ChatsInitial());
  final List<ChatPreview> chats = [
    ChatPreview(
      chatId: "1",
      name: 'John Doe',
      message:
      'Hey Emily, I saw your post about waiting for your biopsy results. I went through somethi..',
      time: '09:55 PM',
    ),
    ChatPreview(
      chatId: "2",
      name: 'Alex Martinez',
      message:
      'Hi Emily, I noticed we have the same neurologist. How was your experience with Dr..',
      time: '09:00 PM',
    ),
    ChatPreview(
      chatId: "3",
      name: 'Lisa Reynolds',
      message:
      '"Hey Emily, I read your post about your upcoming MRI. I’ve had a few myself, and I...',
      time: '08:43 PM',
    ),
    ChatPreview(
      chatId: "4",
      name: 'Lisa Reynolds',
      message:
      '"Hey Emily, I read your post about your upcoming MRI. I’ve had a few myself, and I...',
      time: '08:43 PM',
    ),
    ChatPreview(
      chatId: "5",
      name: 'Lisa Reynolds',
      message:
      '"Hey Emily, I read your post about your upcoming MRI. I’ve had a few myself, and I...',
      time: '08:43 PM',
    ),
    ChatPreview(
      chatId: "6",
      name: 'Lisa Reynolds',
      message:
      '"Hey Emily, I read your post about your upcoming MRI. I’ve had a few myself, and I...',
      time: '08:43 PM',
    ),
    ChatPreview(
      chatId: "7",
      name: 'Lisa Reynolds',
      message:
      '"Hey Emily, I read your post about your upcoming MRI. I’ve had a few myself, and I...',
      time: '08:43 PM',
    ),
    ChatPreview(
      chatId: "8",
      name: 'Lisa Reynolds',
      message:
      '"Hey Emily, I read your post about your upcoming MRI. I’ve had a few myself, and I...',
      time: '08:43 PM',
    ),    ChatPreview(
      chatId: "9",
      name: 'Lisa Reynolds',
      message:
      '"Hey Emily, I read your post about your upcoming MRI. I’ve had a few myself, and I...',
      time: '08:43 PM',
    ),    ChatPreview(
      chatId: "10",
      name: 'Lisa Reynolds',
      message:
      '"Hey Emily, I read your post about your upcoming MRI. I’ve had a few myself, and I...',
      time: '08:43 PM',
    ),    ChatPreview(
      chatId: "11",
      name: 'Lisa Reynolds',
      message:
      '"Hey Emily, I read your post about your upcoming MRI. I’ve had a few myself, and I...',
      time: '08:43 PM',
    ),    ChatPreview(
      chatId: "12",
      name: 'Lisa Reynolds',
      message:
      '"Hey Emily, I read your post about your upcoming MRI. I’ve had a few myself, and I...',
      time: '08:43 PM',
    ),    ChatPreview(
      chatId: "13",
      name: 'Lisa Reynolds',
      message:
      '"Hey Emily, I read your post about your upcoming MRI. I’ve had a few myself, and I...',
      time: '08:43 PM',
    ),    ChatPreview(
      chatId: "14",
      name: 'Lisa Reynolds',
      message:
      '"Hey Emily, I read your post about your upcoming MRI. I’ve had a few myself, and I...',
      time: '08:43 PM',
    ),    ChatPreview(
      chatId: "15",
      name: 'Lisa Reynolds',
      message:
      '"Hey Emily, I read your post about your upcoming MRI. I’ve had a few myself, and I...',
      time: '08:43 PM',
    ),
  ];
  List<MessageModel> allMessages = [
    MessageModel(
      id: 'msg1',
      chatId: '1',
      senderId: 'user1',
      receiverId: 'user2',
      message: 'Hey, how sadddddddddddddddddddddddddddddddddddddddare you?',
      timestamp: DateTime.now(),
      isSentByMe: true,
      status: MessageStatus.sent,
    ),
    MessageModel(
      id: 'msg2',
      chatId: '1',
      senderId: 'user1',
      receiverId: 'user2',
      message: 'Hey, how sadddddddddddddddddddddddddddddddddddddddare you?',
      timestamp: DateTime.now().subtract(Duration(minutes: 5)),
      isSentByMe: true,
      status: MessageStatus.sent,
    ),
    MessageModel(
      id: 'msg3',
      chatId: '1',
      senderId: 'user1',
      receiverId: 'user2',
      message: 'Hey, how sadddddddddddddddddddddddddddddddddddddddare you?',
      timestamp: DateTime.now().subtract(Duration(minutes: 5)),
      isSentByMe: true,
      status: MessageStatus.sent,
    ),
    MessageModel(
      id: 'msg2',
      chatId: '2',
      senderId: 'user2',
      receiverId: 'user1',
      message: 'Did you see the report?',
      timestamp: DateTime.now().subtract(Duration(minutes: 4)),
      isSentByMe: false,
      status: MessageStatus.delivered,
    ),
    MessageModel(
      id: 'msg3',
      chatId: 'chat1',
      senderId: 'user2',
      receiverId: 'user1',
      message: 'I’m good, thanks for asking!',
      timestamp: DateTime.now().subtract(Duration(minutes: 3)),
      isSentByMe: false,
      status: MessageStatus.delivered,
    ),
    MessageModel(
      id: 'msg4',
      chatId: 'chat3',
      senderId: 'user1',
      receiverId: 'user3',
      message: 'Call me when you’re free.',
      timestamp: DateTime.now().subtract(Duration(minutes: 2)),
      isSentByMe: true,
      status: MessageStatus.failed,
    ),
    MessageModel(
      id: 'msg5',
      chatId: '1',
      senderId: 'user1',
      receiverId: 'user2',
      message: 'Will do!',
      timestamp: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: false,
      status: MessageStatus.sent,
    ),
  ];
  final TextEditingController messageController = TextEditingController();
}
