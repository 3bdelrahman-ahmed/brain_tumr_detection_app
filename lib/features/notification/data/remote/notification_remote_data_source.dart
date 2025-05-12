import 'package:brain_tumr_detection_app/core/data/network_services/api_service.dart';
import 'package:brain_tumr_detection_app/features/notification/data/models/notification_model.dart';
import 'package:brain_tumr_detection_app/foundations/app_urls.dart';
import 'package:injectable/injectable.dart';
@singleton
class NotificationRemoteDataSource {
  Future<List<NotificationResponseModel>> getUserNotifications() async {
    final response = await AppDio().get(path: AppUrls.addSlot);



    return [NotificationResponseModel.fromJson(response.data)];
  }
}
