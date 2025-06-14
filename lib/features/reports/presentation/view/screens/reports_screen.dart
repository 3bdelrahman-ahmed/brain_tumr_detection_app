import 'package:brain_tumr_detection_app/core/components/widgets/custom_empty_widget.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/reports/presentation/view/widget/view_patients_report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/widgets/custom_app_shimmer.dart';
import '../../../../../observers/route_observer.dart';
import '../../view_model/reports_cubit.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> with RouteAware {


    @override
  void didPopNext() {
    // Called when coming back to this screen
    super.didPopNext();
    context.read<ReportsCubit>().getAssignedScans(); // refetch
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)! as PageRoute<dynamic>);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final cubit = context.read<ReportsCubit>();

    cubit.getAssignedScans();

    cubit.scrollController.addListener(() {
      // print("Scroll position: ${cubit.scrollController.position.pixels}");

      if (!cubit.isLoadingMore &&
          cubit.scrollController.position.pixels >=
              cubit.scrollController.position.maxScrollExtent - 200.h) {
        // print("Trigger load more...");
        cubit.loadMoreReports();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ReportsCubit>();
    return CustomScrollView(controller: cubit.scrollController, slivers: [
      CustomWelcomeAppBar(),
      BlocBuilder<ReportsCubit, ReportsState>(
        builder: (context, state) {
          if (state is GetAssignedScansLoading) {
            return SliverList(
                delegate: SliverChildBuilderDelegate(
              childCount: 8,
              (context, index) {
                return CustomAppShimmer(
                  height: 100,
                  width: double.infinity,
                  borderRaduis: 10.r,
                ).paddingSymmetric(
                  horizontal: 16.w,
                  vertical: 8.h,
                );
              },
            ));
          } else if (state is GetAssignedScansSuccess ||
              cubit.reports!.reports!.isNotEmpty) {
            return SliverList(
                delegate: SliverChildBuilderDelegate(
              childCount: cubit.reports!.reports!.length +
                  (cubit.isLoadingMore ? 1 : 0),
              (context, index) {
                if (index == cubit.reports!.reports!.length - 1 &&
                    cubit.isLoadingMore) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: CustomAppShimmer(
                      height: 100.h,
                      width: double.infinity,
                      borderRaduis: 10.r,
                    ),
                  );
                }
                return ViewPatientsReport(
                    report: cubit.reports!.reports![index], index: index);
              },
            ));
          } else if (state is GetAssignedScansFailure) {
            return SliverFillRemaining(
              child: Center(child: CustomEmptyWidget.reports()),
            );
          }
          return SliverFillRemaining(
            child: Center(child: CustomEmptyWidget.reports()),
          );
        },
      ),
      // if (cubit.isLoadingMore)
      //   SliverToBoxAdapter(
      //     child: Padding(
      //       padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      //       child: CustomAppShimmer(
      //         height: 100.h,
      //         width: double.infinity,
      //         borderRaduis: 10.r,
      //       ),
      //     ),
      //   ),
      SliverPadding(
          padding: EdgeInsets.only(
        bottom: 90.h,
      )),
    ]);
  }
}
