part of 'chats_cubit.dart';

abstract class ChatsState {}

class ChatsInitial extends ChatsState {}

class ChatsLoading extends ChatsState {}
class MessagesLoading extends ChatsState {}

class SendingMessage extends ChatsState {}

class ChatsLoaded extends ChatsState {
  final List<ChatPreview> chats;

  ChatsLoaded(this.chats);
}

class ChatsError extends ChatsState {
  final String message;

  ChatsError(this.message);
}

class MessagesUpdated extends ChatsState {}
