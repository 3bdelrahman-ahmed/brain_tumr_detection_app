import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/MessageModel.dart';
import '../view/screen/chat_list_screen.dart';

part 'chats_state.dart';

@singleton
class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit() : super(ChatsInitial()) {
    updateChatPreviews();
  }
  final List<ChatPreview> chats = [
    ChatPreview(chatId: "1", name: 'John Doe', message: '', time: DateTime.now(), isRead: false),
    ChatPreview(chatId: "2", name: 'Alex Martinez', message: '', time: DateTime.now(), isRead: false),
    ChatPreview(chatId: "3", name: 'Lisa Reynolds', message: '', time: DateTime.now(), isRead: true),
    ChatPreview(chatId: "4", name: 'Kareem Tamer', message: '', time: DateTime.now(), isRead: false),
    ChatPreview(chatId: "5", name: 'Sara Seyam', message: '', time: DateTime.now(), isRead: false),
    ChatPreview(chatId: "6", name: 'Ahmed Abdelhady', message: '', time: DateTime.now(), isRead: true),
    ChatPreview(chatId: "7", name: 'Leo Messi', message: '', time: DateTime.now(), isRead: false),
    ChatPreview(chatId: "8", name: 'Cristiano Ronaldo', message: '', time: DateTime.now(), isRead: true),
    ChatPreview(chatId: "9", name: 'Ali Maalol', message: '', time: DateTime.now(), isRead: true),
    ChatPreview(chatId: "10",name: 'Mazen Mohamed', message: '', time: DateTime.now(), isRead: false),
  ];

  List<MessageModel> allMessages = [
    MessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      chatId: '1',
      senderId: "${AppConstants.user?.id}",
      receiverId: 'user2',
      message: 'Hey, how are you?',
      timestamp: DateTime.now(),
      isSentByMe: true,
      status: MessageStatus.SENT,
    ),
    MessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      chatId: '2',
      senderId: 'user2',
      receiverId: 'user1',
      message: 'Did you see the report?',
      timestamp: DateTime.now().subtract(Duration(minutes: 4)),
      isSentByMe: false,
      status: MessageStatus.PENDING,
    ),MessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      chatId: '7',
      senderId: 'user2',
      receiverId: 'user1',
      message: 'Vamooooos',
      timestamp: DateTime.now().subtract(Duration(minutes: 4)),
      isSentByMe: false,
      status: MessageStatus.PENDING,
    ),MessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      chatId: '7',
      senderId: 'user2',
      receiverId: 'user1',
      message: 'Vamooooos',
      timestamp: DateTime.now().subtract(Duration(minutes: 4)),
      isSentByMe: false,
      status: MessageStatus.PENDING,
    ),MessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      chatId: '7',
      senderId: 'user2',
      receiverId: 'user1',
      message: 'Come oooon',
      timestamp: DateTime.now().subtract(Duration(minutes: 4)),
      isSentByMe: false,
      status: MessageStatus.PENDING,
    ),
    MessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      chatId: '3',
      senderId: 'user2',
      receiverId: 'user1',
      message: 'I’m good, thanks for asking!',
      timestamp: DateTime.now().subtract(Duration(minutes: 3)),
      isSentByMe: false,
      status: MessageStatus.PENDING,
    ),
    MessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      chatId: '2',
      senderId: "${AppConstants.user?.id}",
      receiverId: 'user3',
      message: 'Call me when you’re free.',
      timestamp: DateTime.now().subtract(Duration(minutes: 2)),
      isSentByMe: true,
      status: MessageStatus.FAILED,
    ),
    MessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      chatId: '1',
      senderId: 'user1',
      receiverId: "${AppConstants.user?.id}",
      message: 'Will do!',
      timestamp: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: false,
      status: MessageStatus.SENT,
    ),
  ];

  final TextEditingController messageController = TextEditingController();

  void sendMessage(String chatId, String text) {
    if (text.trim().isEmpty) return;
    final newMessage = MessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      chatId: chatId,
      senderId: 'user1',
      receiverId: 'user2',
      message: text,
      timestamp: DateTime.now(),
      isSentByMe: true,
      status: MessageStatus.PENDING,
    );
    allMessages.add(newMessage);
    emit(MessagesUpdated());
    Future.delayed(const Duration(seconds: 2),(){
      final success = true;
      final index = allMessages.indexWhere((msg) => msg.id == newMessage.id);
      if (index != -1){
        allMessages[index] = newMessage.copyWith(
          status: success ? MessageStatus.SENT : MessageStatus.FAILED,
        );
        updateChatPreviewForChat(chatId);
        emit(MessagesUpdated());
      }
    });
    messageController.clear();
  }
  void updateChatPreviews() {
    for (int i = 0; i < chats.length; i++) {
      final chat = chats[i];
      final messagesForChat = allMessages.where((msg) => msg.chatId == chat.chatId).toList();
      if (messagesForChat.isNotEmpty) {
        messagesForChat.sort((a, b) => b.timestamp.compareTo(a.timestamp));
        final lastMessage = messagesForChat.first;
        chats[i] = chat.copyWith(
          message: lastMessage.message,
        );
      }
    }

    emit(MessagesUpdated());
  }

  void updateChatPreviewForChat(String chatId) {
    final index = chats.indexWhere((chat) => chat.chatId == chatId);
    if (index != -1) {
      final messagesForChat = allMessages.where((msg) => msg.chatId == chatId).toList();
      if (messagesForChat.isNotEmpty) {
        messagesForChat.sort((a, b) => b.timestamp.compareTo(a.timestamp));
        final lastMessage = messagesForChat.first;
        final updatedChat = chats[index].copyWith(
          message: lastMessage.message,
          time: lastMessage.timestamp,
        );
        // Remove the old position
        chats.removeAt(index);
        // Insert updated chat at the top
        chats.insert(0, updatedChat);
        emit(MessagesUpdated());
      }
    }
  }
  void openChat(String chatId) {
    final index = chats.indexWhere((chat) => chat.chatId == chatId);
    if (index != -1) {
      chats[index] = chats[index].copyWith(isRead: true);
      emit(MessagesUpdated()); // better to use same emit for UI to update cleanly
    }
  }}
