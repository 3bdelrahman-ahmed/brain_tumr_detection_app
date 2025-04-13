import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import 'package:brain_tumr_detection_app/features/reports/presentation/view/widget/view_patients_report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../viewmodel/reports_cubit.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ReportsCubit>();
    return CustomScrollView(
      slivers: [
        CustomWelcomeAppBar(),
        // After Linked with Backend We Will connect
        // with the bool isViewed from backend
        // to Activate change Color
        SliverList(
            delegate: SliverChildBuilderDelegate(
          childCount: cubit.reports.length,
          (context, index) {
            final report = cubit.reports[index];
            return ViewPatientsReport(report: report, index: index);
          },
        ))
      ],
    );
  }
}
