import 'dart:convert';

import 'package:brain_tumr_detection_app/features/chats/data/models/message.dart';

class ConversationResponse {
  final int pageIndex;
  final int pageSize;
  final int count;
  final int totalPages;
  final List<Conversation> data;

  ConversationResponse({
    required this.pageIndex,
    required this.pageSize,
    required this.count,
    required this.totalPages,
    required this.data,
  });

  factory ConversationResponse.fromJson(Map<String, dynamic> json) {
    return ConversationResponse(
      pageIndex: json['pageIndex'],
      pageSize: json['pageSize'],
      count: json['count'],
      totalPages: json['totalPages'],
      data: List<Conversation>.from(
          json['data'].map((x) => Conversation.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        'pageIndex': pageIndex,
        'pageSize': pageSize,
        'count': count,
        'totalPages': totalPages,
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Conversation {
  final int id;
  final Message lastMessage;
  final User user;

  Conversation({
    required this.id,
    required this.lastMessage,
    required this.user,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      id: json['id'],
      lastMessage: Message.fromJson(json['lastMessage']),
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'lastMessage': lastMessage.toJson(),
        'user': user.toJson(),
      };
}

class User {
  final String id;
  final String fullName;
  final String userName;
  final String? profilePicture;

  User({
    required this.id,
    required this.fullName,
    required this.userName,
    this.profilePicture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['fullName'],
      userName: json['userName'],
      profilePicture: json['profilePicture'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'userName': userName,
        'profilePicture': profilePicture,
      };
}
