import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/register_screen_location_widget.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/doctors/presentation/view/widgets/doctor_data_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/string/app_string.dart';
import '../widgets/availabilty_canlendar.dart';

class DoctorsProfile extends StatelessWidget {
  const DoctorsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomWelcomeAppBar(),
          SliverPadding(padding: EdgeInsets.symmetric(vertical: 40.h)),
          SliverToBoxAdapter(
            child: DoctorDataWidget().paddingSymmetric(horizontal: 19.w),
          ),
          SliverPadding(padding: EdgeInsets.symmetric(vertical: 5.h)),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.education,
                    style: AppTextStyles.font16BlueW700,
                  ),
                  6.toHeight,
                  Text(
                    "MBBS, MD in Neurology – University of Oxford",
                    style: AppTextStyles.font12GreenW500,
                  )
                ],
              ),
            ).paddingSymmetric(horizontal: 19.w),
          ),
          SliverPadding(padding: EdgeInsets.symmetric(vertical: 5.h)),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.reviews,
                    style: AppTextStyles.font16BlueW700,
                  ),
                  6.toHeight,
                  Text(
                    "الملك فوق التقييم",
                    style: AppTextStyles.font12GreenW500,
                  )
                ],
              ),
            ).paddingSymmetric(horizontal: 19.w),
          ),
          SliverToBoxAdapter(
            child: DoctorCalendarScreen(),
          )
        ],
      ),
    );
  }
}
