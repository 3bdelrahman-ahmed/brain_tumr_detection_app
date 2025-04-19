part of 'chats_cubit.dart';

@immutable
sealed class ChatsState {}

final class ChatsInitial extends ChatsState {}

class MessagesUpdated extends ChatsState {}

class MessageOpened extends ChatsState {}
