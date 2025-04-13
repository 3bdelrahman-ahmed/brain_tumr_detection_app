import 'package:brain_tumr_detection_app/core/components/widgets/custom_app_logo_container.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/posts_row.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/strings/app_string.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/reports/presentation/view/widget/diagnosis_container.dart';
import 'package:brain_tumr_detection_app/features/reports/presentation/view/widget/diagnosis_expandable_section.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/widgets/custom_button.dart';
import '../../../../../core/utils/responsive_helper.dart';

class ViewReportScreen extends StatelessWidget {
  const ViewReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomWelcomeAppBar(),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
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
               ]
             ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children:[
                        SizedBox(
                            width: 160.w,
                            child: Text("${AppStrings.name}Youssef Ibrahim Marzouk",
                              style: AppTextStyles.font12BlueW700,
                            overflow: TextOverflow.ellipsis,)),
                         3.toHeight,
                         Text("${AppStrings.gender}Male",style: AppTextStyles.font12BlueW700,),
                         3.toHeight,
                         Text("${AppStrings.age}36",style: AppTextStyles.font12BlueW700,),
                         3.toHeight,
                         Text("${AppStrings.submitted}10:20 AM",style: AppTextStyles.font12BlueW700,),
                         3.toHeight,
                       ],
                     ),
                     CustomImageView(
                       svgPath: AssetsSvg.report.toSVG(),
                     )
                   ],
                  ),
                  20.toHeight,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        text: AppStrings.openPdf,
                        onTap: () {},
                        height: 40.h,
                        textStyle: AppTextStyles.font12WhiteW500,
                        width: ResponsiveHelper.isTablet(context) ?120.h :100.h,
                      )
                    ],
                  ),

                ],
              ).paddingSymmetric(vertical: 15.h,horizontal: 20.w),
            ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: Offset(0, 2),)
                ]
              ),
              child: DiagnosisExpandableSection(),
            ).paddingSymmetric(vertical: 10.h,horizontal: 10.w),
          ),
          SliverToBoxAdapter(
            child: CustomButton(text: AppStrings.contactPatient, onTap: (){}).paddingSymmetric(
              horizontal: 20.w,
              vertical: 30.h
            ),
          )
        ],
      ),
    );
  }
}
