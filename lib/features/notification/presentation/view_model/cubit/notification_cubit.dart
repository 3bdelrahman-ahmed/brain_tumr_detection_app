import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/notification_response_model/notification.dart';
import '../../../data/repo/notification_repository.dart';

part 'notification_state.dart';

@injectable
class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository notificationRepository;
  NotificationCubit({required this.notificationRepository})
      : super(NotificationInitial());
  
  int currentPage = 1;
  int totalPages = 1;
  final int pageSize = 10;
  bool hasMoreData = true;
  bool isLoadingMore = false;

  List<Notification> notifications = [];

  Future<void> getNotifications({bool loadMore = false}) async {
    if (loadMore) {
      if (!hasMoreData || isLoadingMore) return;
      isLoadingMore = true;
      emit(NotificationLoadingMore());
    } else {
      currentPage = 1;
      emit(NotificationLoading());
    }

    final result = await notificationRepository.getUserNotifications(
      currentPage, pageSize
    );
    
    result.fold(
      (error) {
        isLoadingMore = false;
        emit(NotificationError());
      },
      (response) {
        if (loadMore) {
          notifications.addAll(response.data ?? []);
        } else {
          notifications = response.data ?? [];
        }
        
        totalPages = response.totalPages ?? 1;
        hasMoreData = currentPage < totalPages;
        
        if (loadMore) {
          isLoadingMore = false;
          emit(NotificationLoaded());
        } else {
          emit(NotificationLoaded());
        }
        
        if (hasMoreData) {
          currentPage++;
        }
      },
    );
  }
}
