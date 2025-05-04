class Message {
  final int id;
  final String senderId;
  final String content;
  final int conversationId;
  final DateTime sentAt;
  final MessageStatus? status;

  Message({
    this.status,
    required this.id,
    required this.senderId,
    required this.content,
    required this.conversationId,
    required this.sentAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      senderId: json['senderId'],
      content: json['content'],
      conversationId: json['conversationId'],
      sentAt: DateTime.parse(json['sentAt']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'senderId': senderId,
        'content': content,
        'conversationId': conversationId,
        'sentAt': sentAt.toIso8601String(),
      };

  Message copyWith({
    int? id,
    String? senderId,
    String? content,
    int? conversationId,
    DateTime? sentAt,
    MessageStatus? status,
  }) {
    return Message(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      content: content ?? this.content,
      conversationId: conversationId ?? this.conversationId,
      sentAt: sentAt ?? this.sentAt,
      status: status ?? this.status,
    );
  }
}

enum MessageStatus {
  SENT,
  PENDING,
  FAILED,
}
