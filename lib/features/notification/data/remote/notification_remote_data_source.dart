import 'package:brain_tumr_detection_app/core/data/network_services/api_service.dart';
import 'package:brain_tumr_detection_app/foundations/app_urls.dart';
import 'package:injectable/injectable.dart';

import '../models/notification_response_model/notification_response_model.dart';

@singleton
class NotificationRemoteDataSource {
  Future<NotificationResponseModel> getUserNotifications(pageIndex,pageSize) async {
    final response = await AppDio().get(path: AppUrls.getNotifications,
        queryParams: {'PageIndex': pageIndex, 'PageSize': pageSize});

    return NotificationResponseModel.fromJson(response.data);
  }
}
