import 'notification.dart';

class NotificationResponseModel {
  int? pageIndex;
  int? pageSize;
  int? count;
  int? totalPages;
  List<Notification>? data;

  NotificationResponseModel({
    this.pageIndex,
    this.pageSize,
    this.count,
    this.totalPages,
    this.data,
  });

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    return NotificationResponseModel(
      pageIndex: json['pageIndex'] as int?,
      pageSize: json['pageSize'] as int?,
      count: json['count'] as int?,
      totalPages: json['totalPages'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Notification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'pageIndex': pageIndex,
        'pageSize': pageSize,
        'count': count,
        'totalPages': totalPages,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
