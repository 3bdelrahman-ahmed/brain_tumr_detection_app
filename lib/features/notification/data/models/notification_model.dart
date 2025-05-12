class NotificationResponseModel {
  final String? id;
  final String? title;
  final String? body;
  final String? imageUrl;
  final String? createdAt;

  NotificationResponseModel({
    this.id,
    this.title,
    this.body,
    this.imageUrl,
    this.createdAt,
  });

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    return NotificationResponseModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      imageUrl: json['image_url'] as String?,
      createdAt: json['created_at'] as String?,
    );
  }
}