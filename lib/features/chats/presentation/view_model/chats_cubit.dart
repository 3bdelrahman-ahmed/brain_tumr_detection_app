import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/core/data/network_services/api_error_handler.dart';
import 'package:brain_tumr_detection_app/features/chats/data/models/get_all_conversations_request.dart';
import 'package:brain_tumr_detection_app/features/chats/data/models/send_message_request.dart';
import 'package:brain_tumr_detection_app/features/chats/data/repository/chat_repository.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/data/network_services/signal_r_connection.dart';
import '../../data/models/chat_preview.dart';
import '../../data/models/get_all_coversation_response.dart';
import '../../data/models/message.dart';

part 'chats_state.dart';

@singleton
class ChatsCubit extends Cubit<ChatsState> {
  final ChatRepository _chatRepository;
  int _currentPage = 1;
  final int _pageSize = 10;
  bool _hasMore = true;
  bool _isLoading = false;
  int? currentOpenConversationId;
  final SignalRConnection _signalRConnection;

  ChatsCubit(this._chatRepository, this._signalRConnection)
      : super(ChatsInitial()) {}

  @override
  Future<void> close() {
    _signalRConnection.disposeSignalR();
    return super.close();
  }

  final TextEditingController messageController = TextEditingController();
  List<ChatPreview> chats = [];
  List<Message> allMessages = [];

  Future<void> initialize({bool refresh = false}) async {
    await loadConversations(refresh: refresh);
    await _signalRConnection
        .initializeSignalRConnection(_handleIncomingMessage);
    print("Hello From SignalR");
  }

  void _handleIncomingMessage(List<dynamic>? arguments) async {
    if (arguments == null || arguments.isEmpty) return;

    try {
      final messageData = arguments[0] as Map<String, dynamic>;

      final newMessage = Message(
        id: messageData['id'],
        senderId: messageData['senderId'].toString(),
        content: messageData['content'],
        sentAt: DateTime.parse(messageData['sentAt']),
        conversationId: messageData['conversationId'],
      );

      if (newMessage.conversationId == currentOpenConversationId) {
        allMessages = [newMessage, ...allMessages];
      }

      final index =
          chats.indexWhere((chat) => chat.chatId == newMessage.conversationId);

      if (index != -1) {
        final updatedChat = chats[index].copyWith(
          message: newMessage.content,
          time: newMessage.sentAt,
        );

        final updatedChats = List<ChatPreview>.from(chats);
        updatedChats.removeAt(index);
        updatedChats.insert(0, updatedChat);
        chats = updatedChats;
        emit(ChatsLoaded(chats));
      } else {
        await loadConversations(refresh: true);
      }
    } catch (e) {
      print("Error parsing incoming message: $e");
    }
  }

  Future<void> loadConversations({bool refresh = false}) async {
    chats.clear();
    if (refresh) {
      _currentPage = 1;
      _hasMore = true;
      emit(ChatsLoading());
    }
    _isLoading = true;

    final request = GetAllConversationsRequest(
      pageSize: _pageSize,
      pageIndex: _currentPage,
    );
    final result = await _chatRepository.getAllUserConversation(request);

    result.fold(
      (error) {
        _isLoading = false;
        emit(ChatsError(error.message ?? ""));
      },
      (response) {
        _isLoading = false;
        _currentPage++;
        _hasMore = response.totalPages > _currentPage;

        final newChats = response.data.map((conversation) {
          return ChatPreview(
            user: conversation.user,
            chatId: conversation.id,
            name: conversation.user.fullName,
            message: conversation.lastMessage.content,
            time: conversation.lastMessage.sentAt,
          );
        }).toList();

        chats = refresh ? newChats : [...chats, ...newChats];
        emit(ChatsLoaded(chats));
      },
    );
  }

  Future<void> getConversationMessages(int conversationId) async {
    currentOpenConversationId = conversationId;
    emit(ChatsLoading());

    final request = GetAllConversationsRequest(
      pageIndex: 1,
      pageSize: 20,
    );

    final result = await _chatRepository.getMessagesOfConversation(
        request, conversationId);

    result.fold(
      (error) {
        emit(ChatsError(error.message ?? "Failed to load messages"));
      },
      (response) {
        allMessages = response.data.map((msg) {
          return Message(
            id: msg.id,
            senderId: msg.senderId.toString(),
            content: msg.content,
            sentAt: msg.sentAt,
            conversationId: msg.conversationId,
          );
        }).toList();
        emit(MessagesUpdated());
      },
    );
  }

  Future<void> sendMessage(SendMessageRequest request) async {
    emit(SendingMessage());

    // Create a temporary pending message
    final tempMessage = Message(
      id: -1,
      senderId: AppConstants.user!.id.toString(),
      content: request.content,
      conversationId: currentOpenConversationId!,
      sentAt: DateTime.now(),
      status: MessageStatus.PENDING,
    );

    // Insert the pending message
    allMessages = [tempMessage, ...allMessages];
    emit(MessagesUpdated());

    messageController.clear();

    final response = await _chatRepository.sendMessage(request);

    response.fold(
      (l) {
        // Replace pending message with failed version
        allMessages = allMessages.map((msg) {
          if (msg.id == tempMessage.id && msg.status == MessageStatus.PENDING) {
            return msg.copyWith(status: MessageStatus.FAILED);
          }
          return msg;
        }).toList();

        emit(MessagesUpdated());
        emit(ChatsError(l.message ?? "Failed to send message"));
      },
      (messageResponse) {
        // Replace pending message with actual one from backend
        allMessages = allMessages.map((msg) {
          if (msg.id == tempMessage.id && msg.status == MessageStatus.PENDING) {
            return Message(
              id: messageResponse.id,
              senderId: messageResponse.senderId.toString(),
              content: messageResponse.content,
              sentAt: messageResponse.sentAt,
              conversationId: messageResponse.conversationId,
              status: MessageStatus.SENT,
            );
          }
          return msg;
        }).toList();

        emit(MessagesUpdated());

        // Update chats preview
        final index =
            chats.indexWhere((c) => c.chatId == currentOpenConversationId);
        if (index != -1) {
          final updatedChat = chats[index].copyWith(
            message: request.content,
            time: DateTime.now(),
          );
          final updatedChats = List<ChatPreview>.from(chats);
          updatedChats.removeAt(index);
          updatedChats.insert(0, updatedChat);
          chats = updatedChats;
        }

        emit(ChatsLoaded(chats));
      },
    );
  }
}
