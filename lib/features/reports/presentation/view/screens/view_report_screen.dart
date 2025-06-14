import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/reports/presentation/view/widget/diagnosis_expandable_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/widgets/custom_button.dart';
import '../../../../../core/helper/functions/convert_time_slot_function.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/model/doctor_reports_model.dart';
import '../../view_model/reports_cubit.dart';
import 'full_image_screen.dart';

class ViewReportScreen extends StatelessWidget {
  Report report;
  ViewReportScreen({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ReportsCubit>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).viewReport,
            style: AppTextStyles.font20BlueW700.copyWith(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          child: Column(children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
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
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${S.of(context).name} ${report.patientName}",
                              style: AppTextStyles.font12BlueW700,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            3.toHeight,
                            Text(
                              "${S.of(context).gender}${report.patientGender}",
                              style: AppTextStyles.font12BlueW700,
                            ),
                            3.toHeight,
                            Text(
                              "${S.of(context).age}${report.age}",
                              style: AppTextStyles.font12BlueW700,
                            ),
                            3.toHeight,
                            Text(
                              "${S.of(context).submitted}${formatTimeTo24Hour(report.uploadDate ?? "")}",
                              style: AppTextStyles.font12BlueW700,
                            ),
                            3.toHeight,
                          ],
                        ),
                      ),
                      8.toWidth,
                    ],
                  ),
                  20.toHeight,
                  Hero(
                    tag:
                        'result-image-${report.id}', // ensure unique tag if multiple reports
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomImageView(
                            url: report.aiGeneratedImagePath,
                            height: 120.w,
                            radius: BorderRadius.circular(10.r),
                            fit: BoxFit.contain,
                          ),
                        ),
                        8.toWidth,
                        Expanded(
                          child: CustomImageView(
                            url: report.imagePath,
                            height: 120.w,
                            radius: BorderRadius.circular(10.r),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  20.toHeight,
                  CustomButton(
                    text: S.of(context).viewResultImage,
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                        opaque: false,
                        barrierDismissible: true,
                        pageBuilder: (_, __, ___) => FullScreenImageViewer(
                          imageUrl: report.aiGeneratedImagePath!,
                          orginalImageUrl: report.imagePath!,
                          heroTag: 'result-image-${report.id}',
                        ),
                      ));
                    },
                    raduis: 8.r,
                    // height: 50.h,
                    textStyle:
                        AppTextStyles.font10WhiteW600.copyWith(fontSize: 16.sp),
                    // width: ResponsiveHelper.isTablet(context) ? 120.h : 100.h,
                  ),
                ],
              ).paddingSymmetric(vertical: 15.h, horizontal: 20.w),
            ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      spreadRadius: 2,
                      offset: Offset(0, 2),
                    )
                  ]),
              child: DiagnosisExpandableSection(
                report: report,
              ),
            ).paddingSymmetric(vertical: 10.h, horizontal: 10.w),
          ]),
        ));
  }
}
