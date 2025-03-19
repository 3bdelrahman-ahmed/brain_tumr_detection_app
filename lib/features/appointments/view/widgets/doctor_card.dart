import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/string/app_string.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/widgets/custom_button.dart';
import '../../../../core/components/widgets/custom_image_view.dart';
import '../../../../core/utils/assets/assets_png.dart';
import '../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../core/utils/theme/text_styles/app_text_styles.dart';

class DoctorCardAppointment extends StatelessWidget {
  const DoctorCardAppointment({Key? key, this.name}) : super(key: key);
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
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
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 157.w,
                width: 134.w,
                decoration: BoxDecoration(
                  color: AppColors.buttonsAndNav,
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                ),
                child: CustomImageView(
                  imagePath: AssetsPng.appointmentTest.toPng(),
                  fit: BoxFit.cover,
                ).paddingSymmetric(vertical: 7.h, horizontal: 7.h),
              ),
              15.toWidth,
              Container(
                width: 130.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name != null ? "Dr: $name" : "Dr : Hamdy Abdelfatah",
                      style: AppTextStyles.font20GreenW700,
                    ),
                    5.toHeight,
                    Text(
                      AppStrings.upComing,
                      style: AppTextStyles.font12LightGreenW500,
                    ),
                    5.toHeight,
                    Text(
                      "February 15, 2025 10:30 AM",
                      style: AppTextStyles.font15LightGreenW500,
                    ),
                    5.toHeight,
                  ],
                ),
              )
            ],
          ),
          25.toHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                text: AppStrings.cancel,
                width: 140.w,
                height: 50.h,
                textStyle: AppTextStyles.font15WhiteW500,
                onTap: () {},
              ),
              CustomButton(
                  text: AppStrings.reScheduled,
                  width: 140.w,
                  height: 50.h,
                  textStyle: AppTextStyles.font15WhiteW500,
                  onTap: () {}),
            ],
          )
        ],
      ).paddingOnly(top: 5.h),
    );
  }
}
