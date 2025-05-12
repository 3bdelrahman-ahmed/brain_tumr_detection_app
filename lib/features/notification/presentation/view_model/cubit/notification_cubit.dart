import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/notification_model.dart';
import '../../../data/repo/notification_repository.dart';

part 'notification_state.dart';
  @injectable
class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository notificationRepository;  
  NotificationCubit({required this.notificationRepository}) : super(NotificationInitial());


  List<NotificationResponseModel> notifications = [];

  Future<void> getNotifications() async{
    emit(NotificationLoading());
    final result = await notificationRepository.getUserNotifications();
    result.fold(
      (error) {
        emit(NotificationError());
      },
      (response) {
        notifications = response;
        emit(NotificationLoaded());
      },
    );
  }
}
