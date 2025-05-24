import 'user.dart';

class GetChatIdModel {
  int? id;
  User? user;

  GetChatIdModel({this.id, this.user});

  factory GetChatIdModel.fromJson(Map<String, dynamic> json) {
    return GetChatIdModel(
      id: json['id'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'user': user?.toJson(),
      };
}
