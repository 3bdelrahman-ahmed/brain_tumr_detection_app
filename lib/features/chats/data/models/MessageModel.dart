class MessageModel {
  final String id;
  final String chatId;
  final String senderId;
  final String receiverId;
  final String message;
  final DateTime timestamp;
  final bool isSentByMe;
  final MessageStatus status;

  MessageModel({
    required this.status,
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.timestamp,
    required this.isSentByMe,
  });
}

enum MessageStatus {
  sent,
  delivered,
  failed,
}
