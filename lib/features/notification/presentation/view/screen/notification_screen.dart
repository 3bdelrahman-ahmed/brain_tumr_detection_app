import 'package:brain_tumr_detection_app/core/components/widgets/custom_app_shimmer.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/strings/app_string.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../../view_model/cubit/notification_cubit.dart';
import '../widgets/notification_card_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final ScrollController _scrollController = ScrollController();
  
  @override
  void initState() {
    super.initState();
    context.read<NotificationCubit>().getNotifications();
    _setupScrollController();
  }
  
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  
  void _setupScrollController() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        final cubit = context.read<NotificationCubit>();
        if (cubit.hasMoreData && !cubit.isLoadingMore) {
          cubit.getNotifications(loadMore: true);
        }
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        final cubit = context.read<NotificationCubit>();
        
        return Scaffold(
          appBar: AppBar(
            notificationPredicate: (ScrollNotification notification) {
              return true;
            },
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 24.w,
                color: AppColors.buttonsAndNav,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              S.of(context).notifications,
              style: AppTextStyles.font24BlueW700,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              await cubit.getNotifications();
            },
            child: Stack(
              children: [
                if (state is NotificationLoading && cubit.notifications.isEmpty)
                   Center(child: NotificationShimmer()),
                if (state is! NotificationLoading || cubit.notifications.isNotEmpty)
                  ListView.separated(
                    controller: _scrollController,
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                    itemBuilder: (context, index) {
                      if (index < cubit.notifications.length) {
                        return NotificationCardWidget(
                          notification: cubit.notifications[index]
                        );
                      } else if (cubit.hasMoreData) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            child:  CustomAppShimmer(
       height: 80.h,
       width: double.infinity,
       borderRaduis: 10,
     ),
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                    separatorBuilder: (context, index) => 16.toHeight,
                    itemCount: cubit.notifications.length + (cubit.hasMoreData ? 1 : 0),
                  ),
                if (state is NotificationError && cubit.notifications.isEmpty)
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Failed to load notifications',
                          style: AppTextStyles.font15BlackW700,
                        ),
                        SizedBox(height: 16.h),
                        ElevatedButton(
                          onPressed: () => cubit.getNotifications(),
                          child: Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                if (state is NotificationLoaded && cubit.notifications.isEmpty)
                  Center(
                    child: Text(
                     S.of(context).noNotifications,
                      style: AppTextStyles.font15BlackW700,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class NotificationShimmer extends StatelessWidget {
  const NotificationShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
     itemBuilder: (context, index) => CustomAppShimmer(
       height: 80.h,
       width: double.infinity,
       borderRaduis: 10,
     ),
     separatorBuilder:(context, index) => 16.toHeight,
     itemCount: 10,
                      );
  }
}
