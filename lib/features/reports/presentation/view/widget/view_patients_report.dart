import 'package:brain_tumr_detection_app/core/helper/functions/convert_time_slot_function.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/reports/data/model/doctor_reports_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/widgets/custom_button.dart';
import '../../../../../core/components/widgets/custom_image_view.dart';
import '../../../../../core/config/app_routing.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../foundations/app_constants.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/reports_cubit.dart';

class ViewPatientsReport extends StatelessWidget {
  final Report report;
  final int index;

  const ViewPatientsReport(
      {Key? key, required this.report, required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ReportsCubit>();
    return BlocBuilder<ReportsCubit, ReportsState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                spreadRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  child: CustomImageView(
                    url: AppConstants.user?.profilePicture,
                    fit: BoxFit.cover,
                    radius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              16.toWidth,
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 120.w,
                                child: Text(
                                  report.patientName ?? '',
                                  style: AppTextStyles.font12BlueW700,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )),
                            8.toHeight,
                            Text(
                              S.of(context).reportIsReady,
                              style: AppTextStyles.font12BlueW700,
                            ),
                          ],
                        ),
                        Text(formatTimeTo24Hour(report.uploadDate ?? ""),
                            style: AppTextStyles.font12GreyW500),
                      ],
                    ),
                    16.toHeight,
                    // ResponsiveHelper.isTablet(context)
                    //     ? 24.toHeight
                    //     : 12.toHeight,
                    CustomButton(
                      raduis: 8.r,
                      text: report.isViewed ?? false
                          ? S.of(context).viewed
                          : S.of(context).viewReport,
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.viewReportScreen,
                            arguments: report);
                        cubit.onViewReport(index);
                      },
                      backgroundColor: report.isViewed ?? false
                          ? AppColors.typography
                          : AppColors.buttonsAndNav,
                      height: 40.h,
                      textStyle: AppTextStyles.font12WhiteW500,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    ).paddingSymmetric(vertical: 10.h, horizontal: 10.w).animate().fadeIn(
          duration: 300.ms,
        );
  }
}
