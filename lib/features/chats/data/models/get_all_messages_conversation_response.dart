import 'message.dart';

class GetAllMessagesConversationResponse {
  final int pageIndex;
  final int pageSize;
  final int count;
  final int totalPages;
  final List<Message> data;

  GetAllMessagesConversationResponse({
    required this.pageIndex,
    required this.pageSize,
    required this.count,
    required this.totalPages,
    required this.data,
  });

  factory GetAllMessagesConversationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAllMessagesConversationResponse(
      pageIndex: json['pageIndex'] as int,
      pageSize: json['pageSize'] as int,
      count: json['count'] as int,
      totalPages: json['totalPages'] as int,
      data: (json['data'] as List)
          .map((messageJson) => Message.fromJson(messageJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pageIndex': pageIndex,
      'pageSize': pageSize,
      'count': count,
      'totalPages': totalPages,
      'data': data.map((message) => message.toJson()).toList(),
    };
  }
}
