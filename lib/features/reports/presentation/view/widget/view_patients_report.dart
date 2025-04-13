import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/widgets/custom_button.dart';
import '../../../../../core/components/widgets/custom_image_view.dart';
import '../../../../../core/utils/responsive_helper.dart';
import '../../../../../core/utils/strings/app_string.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../foundations/app_constants.dart';
import '../../../data/model/ReportsDm.dart';
import '../../viewmodel/reports_cubit.dart';

class ViewPatientsReport extends StatelessWidget {
  final Report report;
  final int index;

  const ViewPatientsReport(
      {Key? key, required this.report, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    var cubit = context.read<ReportsCubit>();
    return BlocBuilder<ReportsCubit, ReportsState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
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
              Container(
                width: 90.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
                child: CustomImageView(
                  url: AppConstants.user?.profilePicture,
                  fit: BoxFit.cover,
                ),
              ),
              15.toWidth,
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 120.w,
                              child: Text(
                                "Youssef Ibrahim Marzouk Ramadan",
                                style: AppTextStyles.font12BlueW700,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )),
                          Text(
                            AppStrings.reportIsReady,
                            style: AppTextStyles.font12BlueW700,
                          ),
                        ],
                      ),
                      20.toWidth,
                      Text(
                          "${dateTime.day} / ${dateTime.month} / ${dateTime.year}",
                          style: AppTextStyles.font12GreyW500),
                    ],
                  ),
                  ResponsiveHelper.isTablet(context)
                      ? 40.toHeight
                      : 20.toHeight,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomButton(
                        text: AppStrings.viewProfile,
                        onTap: () {},
                        height: 40.h,
                        textStyle: AppTextStyles.font12WhiteW500,
                        width: ResponsiveHelper.isTablet(context) ?120.h :100.h,
                      ),
                      ResponsiveHelper.isTablet(context)
                          ? 40.toWidth
                          : 20.toWidth,
                      CustomButton(
                        text: report.isViewed
                            ? AppStrings.viewed
                            : AppStrings.viewReport,
                        onTap: () => cubit.onViewReport(index),
                        backgroundColor: report.isViewed
                            ? AppColors.typography
                            : AppColors.buttonsAndNav,
                        height: 40.h,
                        textStyle: AppTextStyles.font12WhiteW500,
                        width: ResponsiveHelper.isTablet(context) ?120.h :100.h,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    ).paddingSymmetric(vertical: 10.h, horizontal: 10.w);
  }
}
