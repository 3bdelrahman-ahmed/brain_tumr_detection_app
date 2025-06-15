class SendMessageRequest {
  final String receiverId;
  final String content;

  SendMessageRequest({
    required this.receiverId,
    required this.content,
  });

  Map<String, dynamic> toJson() => {
        'receiverId': receiverId,
        'content': content,
      };

  factory SendMessageRequest.fromJson(Map<String, dynamic> json) =>
      SendMessageRequest(
        receiverId: json['receiverId'] as String,
        content: json['content'] as String,
      );
}
