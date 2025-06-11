import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/appointments/data/models/appointments_model.dart';
import 'package:flutter/material.dart';
import '../../../../../core/components/widgets/custom_button.dart';
import '../../../../../core/components/widgets/custom_image_view.dart';
import '../../../../../core/helper/functions/convert_time_slot_function.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../generated/l10n.dart';

class DoctorCardAppointment extends StatelessWidget {
  Appointments appointment;
  DoctorCardAppointment({Key? key, required this.appointment})
      : super(key: key);

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
                  url: appointment.doctorProfilePicture,
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
                      "Dr: ${appointment.doctorName ?? "Hamdy Abdelfatah"}",
                      style: AppTextStyles.font20GreenW700,
                    ),
                    5.toHeight,
                    Text(
                      S.of(context).upComing,
                      style: AppTextStyles.font12LightGreenW500,
                    ),
                    5.toHeight,
                    Text(
                      appointment.date ?? "2023-10-01",
                      style: AppTextStyles.font15LightGreenW500,
                    ),
                    5.toHeight,
                    Text(
                      formatTimeTo24Hour(appointment.startTime ?? "9:00:00"),
                      style: AppTextStyles.font15LightGreenW500,
                    ),
                  ],
                ),
              )
            ],
          ),
          25.toHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomButton(
                  raduis: 8.r,
                  backgroundColor: AppColors.error,
                  text: S.of(context).cancel,
                  height: 50.h,
                  textStyle: AppTextStyles.font15WhiteW500,
                  onTap: () {},
                ),
              ),
              10.toWidth,
              Expanded(
                child: CustomButton(
                  backgroundColor: AppColors.typography,
                  raduis: 8.r,
                  text: S.of(context).reScheduled,
                  height: 50.h,
                  textStyle: AppTextStyles.font15WhiteW500,
                  onTap: () {},
                ),
              ),
            ],
          )
        ],
      ).paddingOnly(top: 5.h),
    );
  }
}
