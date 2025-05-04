import 'get_all_coversation_response.dart';

class ChatPreview {
  final int chatId;
  final String name;
  final String message;
  final DateTime time;
  final User user;

  ChatPreview({
    required this.user,
    required this.chatId,
    required this.name,
    required this.message,
    required this.time,
  });

  ChatPreview copyWith({
    int? chatId,
    String? name,
    String? message,
    DateTime? time,
    User? user,
  }) {
    return ChatPreview(
      user: user ?? this.user,
      chatId: chatId ?? this.chatId,
      name: name ?? this.name,
      message: message ?? this.message,
      time: time ?? this.time,
    );
  }
}