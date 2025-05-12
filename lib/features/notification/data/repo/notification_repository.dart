import 'package:brain_tumr_detection_app/core/data/network_services/api_error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../models/notification_model.dart';
import '../remote/notification_remote_data_source.dart';
@singleton
class NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;
  
   NotificationRepository({required this.remoteDataSource});
  Future<Either<ApiErrorModel,List<NotificationResponseModel>>> getUserNotifications() async {
    try {
      final response = await remoteDataSource.getUserNotifications();
      return Right(response);
    } on Exception catch (e) {
      throw Left(ErrorHandler.handle(e));
    } 
  }
}