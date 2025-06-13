class Notification {
  int? id;
  String? title;
  String? body;
  String? type;
  String? createdAt;

  Notification({this.id, this.title, this.body, this.type, this.createdAt});

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json['id'] as int?,
        title: json['title'] as String?,
        body: json['body'] as String?,
        type: json['type'] as String?,
        createdAt: json["createdAt"] as String?
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
        'type': type,
        'date': createdAt,
      };
}
